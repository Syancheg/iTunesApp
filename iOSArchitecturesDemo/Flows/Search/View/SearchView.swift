//
//  SearchView.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: class {
    func changeSearch()
}

final class SearchView: UIView {
    
    // MARK: - Subviews
    
    let searchBar = UISearchBar()
    let control = UISegmentedControl(items: ["Поиск приложений", "Поиск музыки"])
    let tableView = UITableView()
    let emptyResultView = UIView()
    let emptyResultLabel = UILabel()
    var type = SearchType.shared
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSearchBar()
        self.addControl()
        self.addTableView()
        self.addEmptyResultView()
        self.setupConstraints()
    }
    
    private func addSearchBar() {
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.searchBarStyle = .minimal
        self.addSubview(self.searchBar)
    }
    
    private func addTableView() {
        self.tableView.rowHeight = 72.0
        self.tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.isHidden = true
        self.tableView.tableFooterView = UIView()
        self.addSubview(self.tableView)
    }
    
    private func addEmptyResultView() {
        self.emptyResultView.translatesAutoresizingMaskIntoConstraints = false
        self.emptyResultView.backgroundColor = .white
        self.emptyResultView.isHidden = true
        
        self.emptyResultLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emptyResultLabel.text = "Nothing was found"
        self.emptyResultLabel.textColor = UIColor.darkGray
        self.emptyResultLabel.textAlignment = .center
        self.emptyResultLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        self.addSubview(self.emptyResultView)
        self.emptyResultView.addSubview(self.emptyResultLabel)
    }
    
    private func addControl(){
        switch type.type {
        case .app:
            self.control.selectedSegmentIndex = 0
        case .songs:
            self.control.selectedSegmentIndex = 1
        }
        
        self.control.addTarget(self, action: #selector(chengeType), for: .valueChanged)
        self.control.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.control)
    }
    
    @objc func chengeType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            type.type = .app
        case 1:
            type.type = .songs
        default:
            break
        }
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.control.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            self.control.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.control.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            self.searchBar.topAnchor.constraint(equalTo: self.control.bottomAnchor, constant: 8.0),
            self.searchBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            self.emptyResultView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.emptyResultView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.emptyResultView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.emptyResultView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.emptyResultLabel.topAnchor.constraint(equalTo: self.emptyResultView.topAnchor, constant: 12.0),
            self.emptyResultLabel.leadingAnchor.constraint(equalTo: self.emptyResultView.leadingAnchor),
            self.emptyResultLabel.trailingAnchor.constraint(equalTo: self.emptyResultView.trailingAnchor)
            ])
    }
}
