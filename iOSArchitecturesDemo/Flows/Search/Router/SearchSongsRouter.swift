//
//  SearchSongsRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongsRouterInput {
    func openDetails(for song: ITunesSong)
}

@available(iOS 13.0, *)
class SearchSongsRouter: SearchSongsRouterInput {
    
    
    weak var viewController: UIViewController?
    
    
    func openDetails(for song: ITunesSong) {
        let songPlaybackViewController = SongPlaybackViewController(song: song)
        viewController?.navigationController?.pushViewController(songPlaybackViewController, animated: true)
        
    }
}
