//
//  SearchSongsIteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SearchSongsIteractorInput {
    func requestSongs(with query: String, complition: @escaping ([ITunesSong]) -> Void)
}

class SearchSongsIteractor: SearchSongsIteractorInput {

    private let searchService = ITunesSearchService()
    private let cash = Cash.shared
    
    
    func requestSongs(with query: String, complition: @escaping ([ITunesSong]) -> Void) {
        if cash.cashedResult(queryString: query) {
            complition(cash.songsCash)
        } else {
            searchService.getSongs(forQuery: query) { [weak self] (result) in
                guard let self = self else { return }
                
                result.withValue { (songs) in
                    self.cash.songsCash = songs
                    self.cash.time = Date()
                    self.cash.query = query
                    complition(songs)
                }.withError { (error) in
                    complition([])
                }
            }
        }
    }
}
