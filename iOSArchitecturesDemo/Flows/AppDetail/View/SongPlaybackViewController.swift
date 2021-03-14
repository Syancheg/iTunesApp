//
//  SongPlaybackViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SongPlaybackViewController: UIViewController {
    
    //MARK: - properties
    
    public var song: ITunesSong
    private var viewModel: SongPlaybackViewModelInput?
    
    //MARK: - life circle
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SongPlaybackViewModel(progress: 0, onProgressViewChanged: {[ weak self ] (progress) in
            self?.progressView.setProgress(Float(progress), animated: false)
        })
        
    }
    
    //MARK: - subviews
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private struct Style {
        static let buttonsPadding: CGFloat = 10
        static let buttonsCornerRadius: CGFloat = 5
        static let viewPaddingTop: CGFloat = 20
    }
    
    private(set) lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.tag = 0
        button.contentEdgeInsets = UIEdgeInsets(top: Style.buttonsPadding,
                                                left: Style.buttonsPadding,
                                                bottom: Style.buttonsPadding,
                                                right: Style.buttonsPadding)
        button.scalesLargeContentImage = true
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = Style.buttonsCornerRadius
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(battonTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: Style.buttonsPadding,
                                                left: Style.buttonsPadding,
                                                bottom: Style.buttonsPadding,
                                                right: Style.buttonsPadding)
        button.tag = 1
        button.setImage(UIImage(systemName: "pause"), for: .normal)
        button.scalesLargeContentImage = true
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = Style.buttonsCornerRadius
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(battonTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: Style.buttonsPadding,
                                                left: Style.buttonsPadding,
                                                bottom: Style.buttonsPadding,
                                                right: Style.buttonsPadding)
        button.tag = 2
        button.setImage(UIImage(systemName: "stop"), for: .normal)
        button.scalesLargeContentImage = true
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = Style.buttonsCornerRadius
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(battonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func battonTapped(_ sender: UIButton){
        switch sender.tag {
        case 0:
            viewModel?.play()
        case 1:
            viewModel?.pause()
        case 2:
            viewModel?.stop()
        default:
            break
        }
    }
    
    //MARK: - configureUI
    
    private func configureUI() {
        view.backgroundColor = .white
        imageView.downloadImage(urlPath: song.artwork)
        view.addSubview(imageView)
        view.addSubview(progressView)
        
        let stackView = UIStackView()
        stackView.spacing = 15
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(pauseButton)
        stackView.addArrangedSubview(stopButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let width = view.bounds.width - 64
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            imageView.heightAnchor.constraint(equalToConstant: width),
            imageView.widthAnchor.constraint(equalToConstant: width),
            
            progressView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Style.viewPaddingTop),
            progressView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            progressView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: Style.viewPaddingTop),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),

        ])
    }
    
    
}
