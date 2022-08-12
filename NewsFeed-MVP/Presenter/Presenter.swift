//
//  Presenter.swift
//  NewsFeed-MVP
//
//  Created by Евгений колесников on 11.08.2022.
//

import Foundation
import Alamofire
import UIKit


protocol NewsPresenterDelegate: AnyObject {
    func getNews(news: [NewsModel])
}
typealias NewsPresenter = NewsPresenterDelegate & UIViewController


class Presenter {
    var delegate: NewsPresenter?
    
    public func setNewsDelegate(delegate: NewsPresenter) {
        self.delegate = delegate
    }
    
    func getNews() {
        AF.request("https://webapi.autodoc.ru/api/news/1/50", method: .get).response { response in
            guard response.error == nil else {
                print(response.error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                guard let data = response.data else {
                    return
                }
                let newsPack = try JSONDecoder().decode(Model.self, from: data)
                self.delegate?.getNews(news: newsPack.news)
                
            } catch {
                print("Error")
            }
        }
    }
    
    
}
