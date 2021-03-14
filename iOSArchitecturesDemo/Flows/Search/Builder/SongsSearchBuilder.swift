//
//  SongsSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongsSearchBuilder {
    
    static func build() -> ( UIViewController & SearchSongsViewInput) {
        let presenter = SearchSongsPresenter()
        let viewController = SearchSongsViewController(presenter: presenter)
        presenter.viewInput = viewController
        
        return viewController
    }
    
}
