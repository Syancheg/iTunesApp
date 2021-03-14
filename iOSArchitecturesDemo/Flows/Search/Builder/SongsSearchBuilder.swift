//
//  SongsSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SongsSearchBuilder {
    
    static func build() -> ( UIViewController & SearchSongsViewInput) {
        let iteractor = SearchSongsIteractor()
        let router = SearchSongsRouter()
        let presenter = SearchSongsPresenter(iteractor: iteractor, router: router)
        let viewController = SearchSongsViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
