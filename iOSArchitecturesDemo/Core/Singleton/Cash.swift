//
//  Cash.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class Cash{
    static let shared = Cash()
    var songsCash: [String: [ITunesSong]] = [:]
    var time: [String: Date] = [:]
    private init() {}
    
    func cashedResult(queryString: String) -> Bool{
        
        guard let timeCashed = time[queryString],
              let _ = songsCash[queryString] else {
            return false
        }
        let now = Date()
        let difference = Calendar.current.dateComponents([.minute], from: timeCashed, to: now).minute
        if difference! < 30 {
            return true
        } else {
            return false
        }
        
    }
    
}
