//
//  SearchSongsPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SearchSongsViewInput: class {
    
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func hideNoResults()
    func showNoResults()
    func throbber(show: Bool)
}

protocol SearchSongsViewOutput {
    
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ app: ITunesSong)
}

class SearchSongsPresenter {
    
    let iteractor: SearchSongsIteractorInput
    let router: SearchSongsRouterInput
    
    init(iteractor: SearchSongsIteractorInput, router: SearchSongsRouterInput) {
        self.iteractor = iteractor
        self.router = router
    }
    
    weak var viewInput: (UIViewController & SearchSongsViewInput)?
    
    private func requestSongs(with query: String){
        iteractor.requestSongs(with: query) { [weak self] (result) in
            guard let self = self else { return }
            
            if !result.isEmpty {
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = result
            } else {
                self.viewInput?.showNoResults()
                return
            }
        }
    }
}

extension SearchSongsPresenter: SearchSongsViewOutput{
    
    func viewDidSelectSong(_ app: ITunesSong) {
        router.openDetails(for: app)
    }
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        requestSongs(with: query)
    }
}
