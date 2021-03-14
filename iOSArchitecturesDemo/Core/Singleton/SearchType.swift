//
//  SearchType.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum TypeSearch: Int {
    case songs
    case app
}

protocol SearchTypeDelegate {
    func changeSearch()
}

class SearchType {
    static let shared = SearchType()
    var type: TypeSearch = .app {
        didSet{
            delegate?.changeSearch()
        }
    }
    var delegate: SearchTypeDelegate?
    private init() {}
}
