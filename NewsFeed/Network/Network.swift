//
//  Network.swift
//  NewsFeed
//
//  Created by Евгений колесников on 02.08.2022.
//

import Foundation
import UIKit

class NetWork {
    static let shared = NetWork()
    var newsPack: [NewsModel]?
    
    func loadNews(page: Int?, count: Int?) {
        
        let url = URL(string: "https://webapi.autodoc.ru/api/news/\(page ?? 1)/\(count ?? 10)")
        let task = URLSession.shared.dataTask(with: url!) { data, _, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            guard let data = data else { return }
            let response = try? JSONDecoder().decode(Model.self, from: data)
            self.newsPack = response?.news
            NotificationCenter.default.post(name: Notification.Name("update"), object: nil)
            
            
        }
    task.resume()
    
}

}
