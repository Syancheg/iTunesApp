//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailVersionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congureUI()
    }
    
    private func congureUI() {
        appDetailVersionView.titleLabel.text = "Что нового"
        appDetailVersionView.versionLabel.text = app.version
        appDetailVersionView.listUpdatesLabel.text = app.listUpdates
        appDetailVersionView.lastUpdateLabel.text = app.daysHavePassed(stringDate: app.lastUpdate)
    }
    
}
 
