//
//  AppDetailScreenView.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenView: UICollectionView {
    
    private struct Style {
        static let imagePadding: CGFloat = 16
        static let minimumLineSpacing: CGFloat = 20
    }
    
    let cellSize = (UIScreen.main.bounds.width - (Style.imagePadding * 2) - (Style.minimumLineSpacing / 2)) / 1.5
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Style.minimumLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 0, left: Style.imagePadding, bottom: 0, right: Style.imagePadding)
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
