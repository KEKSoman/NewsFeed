//
//  ViewController.swift
//  NewsFeed-MVP
//
//  Created by Евгений колесников on 11.08.2022.
//
import Foundation
import UIKit
import SnapKit



class NewsFeedViewController: UIViewController {

   let navigationView = UIView()
    let navigationTitle = UILabel()
    let tableView = UITableView()
    var news: [NewsModel]?
    let presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(navigationView)
        view.addSubview(tableView)
        navigationView.addSubview(navigationTitle)
        setupConstraints()
        setUI()
        presenter.setNewsDelegate(delegate: self)
        presenter.getNews()
    }

    private func setupConstraints() {
    
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationTitle.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(50)
        }
        
        navigationTitle.snp.makeConstraints { make in
            make.centerX.equalTo(navigationView.snp.centerX)
            make.centerY.equalTo(navigationView.snp.centerY)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).inset(16)
            make.right.equalTo(view.snp.right).inset(16)
            make.top.equalTo(navigationView.snp.bottom)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func setUI() {
        navigationView.backgroundColor = .white
        navigationTitle.text = "News Feed"
        navigationTitle.textColor = .black
        navigationTitle.font = UIFont.boldSystemFont(ofSize: 20)
        tableView.backgroundColor = .clear
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NewsFeedViewController: NewsPresenterDelegate {
   func getNews(news: [NewsModel]) {
        self.news = news
       
       DispatchQueue.main.async {
           self.tableView.reloadData()
       }
    }
}

extension NewsFeedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let currentNews = news?[indexPath.row]
        cell.newsTitle.text = currentNews?.title
        cell.newsImage.loadImage(url: currentNews?.titleImageUrl)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = URL(string: news?[indexPath.row].fullUrl ?? "") else { return }
        UIApplication.shared.open(urlString)
    }
    
}
