//
//  UIImageView+Extension.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Кузнецов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func downloadImage(urlPath: String?){
        if let urlPath = urlPath, let url = URL(string: urlPath) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, respons, error) in
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            task.resume()
        } else {
            self.image = UIImage(named: "note")
        }
    }
    
}
