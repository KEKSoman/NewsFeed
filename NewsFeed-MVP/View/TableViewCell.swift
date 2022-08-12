//
//  TableViewCell.swift
//  NewsFeed-MVP
//
//  Created by Евгений колесников on 12.08.2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    let newsImage = UIImageView()
    let newsTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(newsImage)
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalTo(self.snp.left)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.snp.makeConstraints { make in
            make.left.equalTo(newsImage.snp.right).offset(16)
            make.right.equalTo(self.snp.right).inset(16)
            make.centerY.equalTo(self.snp.centerY)
        }
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
