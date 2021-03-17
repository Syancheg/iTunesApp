//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    private(set) lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.titleLabel.text = cellModel.title
        self.collectionLabel.text = cellModel.collection
        self.genreLabel.text = cellModel.genreName
        self.coverImageView.downloadImage(urlPath: cellModel.cover)
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.addCoverImage()
        self.addTitleLabel()
        self.addCollectionLabel()
        self.addGenreLabel()
    }
    
    private func addCoverImage() {
        self.contentView.addSubview(self.coverImageView)
        NSLayoutConstraint.activate([
            self.coverImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0),
            self.coverImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.coverImageView.widthAnchor.constraint(equalToConstant: 50.0),
            self.coverImageView.heightAnchor.constraint(equalToConstant: 50.0)
            ])
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -30.0)
            ])
    }
    
    private func addCollectionLabel() {
        self.contentView.addSubview(self.collectionLabel)
        NSLayoutConstraint.activate([
            self.collectionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.collectionLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 12.0),
            self.collectionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -30.0)
            ])
    }
    
    private func addGenreLabel() {
        self.contentView.addSubview(self.genreLabel)
        NSLayoutConstraint.activate([
            self.genreLabel.topAnchor.constraint(equalTo: self.collectionLabel.bottomAnchor, constant: 4.0),
            self.genreLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 12.0),
            self.genreLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -30.0)
            ])
    }

}
