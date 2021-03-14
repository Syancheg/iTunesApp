//
//  AppDetailScreenView.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var screenShots: [String] = []{
        didSet{
            reloadData()
        }
    }
    
    private struct Style {
        static let imagePadding: CGFloat = 16
        static let minimumLineSpacing: CGFloat = 10
    }
    
    let cellSize = (UIScreen.main.bounds.width - (Style.imagePadding * 2) - (Style.minimumLineSpacing / 2)) / 1.5
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Style.minimumLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .clear
        register(ScreenCell.self, forCellWithReuseIdentifier: ScreenCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 0, left: Style.imagePadding, bottom: 0, right: Style.imagePadding)
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isScrollEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenShots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ScreenCell.reuseId, for: indexPath) as! ScreenCell
        cell.screenView.downloadImage(urlPath: screenShots[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: cellSize, height: frame.height)
    }
    
}
