//
//  TableViewCell.swift
//  NewsFeed
//
//  Created by Евгений колесников on 02.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    let newsImage = UIImageView() // 40x40, leading = 10, centerY
    let newsTitle = UILabel() // trailing, leading = 16, centerY
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(newsImage)
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImage.widthAnchor.constraint(equalToConstant: 40),
            newsImage.heightAnchor.constraint(equalToConstant: 40),
            newsImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsTitle.leftAnchor.constraint(equalTo: newsImage.rightAnchor, constant: 16),
            newsTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 16),
            newsTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupCell() {
        self.selectionStyle = .none
        newsTitle.numberOfLines = 2
        newsTitle.adjustsFontSizeToFitWidth = true
        newsTitle.textColor = .black
        newsTitle.font = UIFont.boldSystemFont(ofSize: 14)
        newsImage.contentMode = .scaleAspectFit
        newsImage.image = UIImage(named: "default.image")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
