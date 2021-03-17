//
//  AppDetailScreenViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenViewController: UIViewController {
    
    private let collectionView: AppDetailScreenView
    private let app: ITunesApp
    
    init(app: ITunesApp) {
        self.app = app
        self.collectionView = AppDetailScreenView()
        self.collectionView.screenShots = app.screenshotUrls
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 350)
            
        ])
    }
}
