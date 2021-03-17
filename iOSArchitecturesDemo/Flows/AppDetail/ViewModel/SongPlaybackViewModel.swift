//
//  SongPlaybackViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongPlaybackViewModelInput {
    func play()
    func pause()
    func stop()
}

protocol SongPlaybackViewModelOutput {
    var onProgressViewChanged: ((Double) -> Void)? { get set }
}

class SongPlaybackViewModel: SongPlaybackViewModelOutput {
    
    
    var onProgressViewChanged: ((Double) -> Void)?
    
    private var timer: Timer?
    
    private var progress: Double {
        didSet {
            onProgressViewChanged?(progress)
        }
    }
    
    init(progress: Double, onProgressViewChanged: ((Double) -> Void)?){
        self.onProgressViewChanged = onProgressViewChanged
        self.progress = progress
        onProgressViewChanged?(progress)
    }
}

extension SongPlaybackViewModel:  SongPlaybackViewModelInput {
    func play() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [ weak self ] timer in
            guard let self = self else { return }
            guard self.progress < 1 else {
                timer.invalidate()
                return
            }
            let newProgress = self.progress + 0.05
            if self.progress >= 1 {
                self.stop()
                return
            }
            self.progress = newProgress
        })
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func stop() {
        timer?.invalidate()
        progress = 0
    }
}

