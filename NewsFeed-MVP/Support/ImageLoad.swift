//
//  ImageLoad.swift
//  NewsFeed-MVP
//
//  Created by Евгений колесников on 12.08.2022.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func loadImage(url: String?) {
        guard let url = url else {
            self.image = UIImage(named: "default.image")
            return
        }
        let resource = URL(string: url)
        let placeholderImage = UIImage(named: "default.image")
        self.kf.setImage(with: resource,
                         placeholder: placeholderImage,
                         options: [.transition(.fade(1)),
                                   .cacheOriginalImage,
                                   .waitForCache])
                                   
    }
}
