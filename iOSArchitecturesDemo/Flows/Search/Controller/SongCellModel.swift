//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

struct SongCellModel {
    let title: String
    let collection: String
    let cover: String
    let genreName: String
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: "\(model.artistName ?? "") — \(model.trackName)",
                             collection: model.collectionName ?? "",
                             cover: model.artwork ?? "",
                             genreName: model.genreName ?? "")
    }
    
    
    
}
