//
//  TableViewCell.swift
//  NewsFeed
//
//  Created by Евгений колесников on 02.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView?
    @IBOutlet weak var newsTitle: UILabel?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .white
        
        newsTitle?.textColor = .black
        newsTitle?.font = UIFont.boldSystemFont(ofSize: 14)
        
    }
}
