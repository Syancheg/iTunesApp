//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class AppStartManager {
    
    var window: UIWindow?
    var type = SearchType.shared
    init(window: UIWindow?) {
        self.window = window
        self.type.delegate = self
    }
    
    func start() {
        switch type.type {
        case .app:
            let rootVC = SearchBuilder.build()
            rootVC.navigationItem.title = "Search via iTunes"
            
            let navVC = self.configuredNavigationController
            navVC.viewControllers = [rootVC]
            
            window?.rootViewController = navVC
            window?.makeKeyAndVisible()
        case .songs:
            let rootVC = SongsSearchBuilder.build()
            rootVC.navigationItem.title = "Search via iTunes"
            
            let navVC = self.configuredNavigationController
            navVC.viewControllers = [rootVC]

            window?.rootViewController = navVC
            window?.makeKeyAndVisible()
            
        }
        
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}

@available(iOS 13.0, *)
extension AppStartManager: SearchTypeDelegate {
    func changeSearch(){
        start()
    }
}
