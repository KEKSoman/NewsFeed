//
//  Model.swift
//  NewsFeed
//
//  Created by Евгений колесников on 02.08.2022.
//

import Foundation
import UIKit

struct Model: Codable {
    let news: [NewsModel]
    
    enum CodingKeys: String, CodingKey {
        case news = "news"
    }
}

struct NewsModel: Codable {
    let title: String
    let description: String
    let titleImageUrl: String
    let fullUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case titleImageUrl
        case fullUrl
    }
}


