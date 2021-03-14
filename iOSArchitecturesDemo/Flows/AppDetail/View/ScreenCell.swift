//
//  ScreenCell.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class ScreenCell: UICollectionViewCell {
    
    static let reuseId  = "ScreenCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var screenView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupView(){
        addSubview(screenView)
        NSLayoutConstraint.activate([
            screenView.leftAnchor.constraint(equalTo: leftAnchor),
            screenView.rightAnchor.constraint(equalTo: rightAnchor),
            screenView.topAnchor.constraint(equalTo: topAnchor),
            screenView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}
