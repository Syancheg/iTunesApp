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
    var songsCash: [ITunesSong] = []
    var time: Date?
    var query: String?
    private init() {}
    
    func cashedResult(queryString: String) -> Bool{
        if query != nil && query == queryString {
            guard let timeCashed = time else {
                return false
            }
            let now = Date()
            let difference = Calendar.current.dateComponents([.minute], from: timeCashed, to: now).minute
            if difference! < 30 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
        
    }
    
}
