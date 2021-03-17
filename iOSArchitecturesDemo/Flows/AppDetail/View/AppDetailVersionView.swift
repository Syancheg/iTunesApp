//
//  AppDetailVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var listUpdatesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var historyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История обновлений", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.masksToBounds = true

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        backgroundColor = .clear
        
        self.addSubview(titleLabel)
        self.addSubview(lastUpdateLabel)
        self.addSubview(historyButton)
        self.addSubview(versionLabel)
        self.addSubview(listUpdatesLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            
            historyButton.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            historyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            historyButton.heightAnchor.constraint(equalToConstant: 20),
            
            lastUpdateLabel.topAnchor.constraint(equalTo: historyButton.bottomAnchor, constant: 10.0),
            lastUpdateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            versionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            
            listUpdatesLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 10.0),
            listUpdatesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            listUpdatesLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            listUpdatesLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
