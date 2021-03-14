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
    
    private let searchService = ITunesSearchService()
    
    weak var viewInput: (UIViewController & SearchSongsViewInput)?
    
    private func requestSongs(with query: String){
        
        self.searchService.getSongs(forQuery: query) { [weak self] (songs) in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            songs
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

extension SearchSongsPresenter: SearchSongsViewOutput{
    func viewDidSelectSong(_ app: ITunesSong) {
        
    }
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        requestSongs(with: query)
    }
}
