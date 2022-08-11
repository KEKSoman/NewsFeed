//
//  ViewController.swift
//  NewsFeed
//
//  Created by Евгений колесников on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    let cell = "TableViewCell"
    var news: [NewsModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetWork.shared.loadNews(page: 1, count: 50)
        
        tableView?.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: Notification.Name("update"), object: nil)        
    }

    @objc private func updateData() {
        DispatchQueue.main.async {
            self.news = NetWork.shared.newsPack
            self.tableView?.reloadData()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TableViewCell else { return}
        let oneNews = news?[indexPath.row]
        cell.newsTitle?.text = oneNews?.title
        cell.newsImage?.loadImageUsingCache(urlString: oneNews?.titleImageUrl)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oneNews = news?[indexPath.row]
        guard let url = URL(string: oneNews?.fullUrl ?? "") else { return }
        UIApplication.shared.open(url)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
