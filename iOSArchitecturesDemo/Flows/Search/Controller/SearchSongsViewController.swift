//
//  SearchSongsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit


class SearchSongsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var searchView: SearchView {
        return self.view as! SearchView
    }
    
    var searchResults = [ITunesSong]() {
        didSet {
            searchView.tableView.isHidden = false
            searchView.tableView.reloadData()
            searchView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "SongCell"
    }
    
    private let presenter: SearchSongsViewOutput
    
    // MARK: - Lifecycle
    
    init(presenter: SearchSongsViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
    // MARK: - Private
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.tableView.isHidden = true
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    
    private func requestSongs(with query: String) {
        presenter.viewDidSearch(with: query)
        self.searchResults = []
        self.searchView.tableView.reloadData()
    }
    
}

extension SearchSongsViewController: SearchSongsViewInput {
    
}

//MARK: - UITableViewDataSource
extension SearchSongsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? SongCell else {
            return dequeuedCell
        }
        let app = self.searchResults[indexPath.row]
        let cellModel = SongCellModelFactory.cellModel(from: app)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchSongsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let songs = searchResults[indexPath.row]
//        presenter.viewDidSearch(with: <#T##String#>)
    }
}

//MARK: - UISearchBarDelegate
extension SearchSongsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        self.requestSongs(with: query)
    }
}
