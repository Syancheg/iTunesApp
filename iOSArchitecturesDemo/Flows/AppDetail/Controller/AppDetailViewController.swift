//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp
    var scrollView: UIScrollView!
    
    lazy var headerDetailViewController = AppDetailHeaderViewController(app: app)
    lazy var versionDetailViewController = AppDetailVersionViewController(app: app)
    lazy var screenDetailViewController = AppDetailScreenViewController(app: app)
    
//    private var appDetailView: AppDetailView {
//        return self.view as! AppDetailView
//    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
//    override func loadView() {
//        super.loadView()
//        self.view = AppDetailView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.configureNavigationController()
        
//        self.downloadImage()
        
        addChildViewController()
        addDescriptionViewController()
        addScreenViewController()
        
    }
    
    // MARK: - Private
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addChildViewController() {
        
        view.addSubview(headerDetailViewController.view)
        addChild(headerDetailViewController)
        
        headerDetailViewController.didMove(toParent: self)
        
        headerDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerDetailViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerDetailViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerDetailViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
    }
    
    private func addDescriptionViewController() {
        
        view.addSubview(versionDetailViewController.view)
        addChild(versionDetailViewController)
        
        versionDetailViewController.didMove(toParent: self)
        
        versionDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            versionDetailViewController.view.topAnchor.constraint(equalTo: headerDetailViewController.view.bottomAnchor),
            versionDetailViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            versionDetailViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func addScreenViewController(){
        view.addSubview(screenDetailViewController.view)
        addChild(screenDetailViewController)
        
        screenDetailViewController.didMove(toParent: self)
        
        screenDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenDetailViewController.view.topAnchor.constraint(equalTo: versionDetailViewController.view.bottomAnchor, constant: 12),
            screenDetailViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            screenDetailViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            screenDetailViewController.view.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
