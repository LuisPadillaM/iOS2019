//
//  NewsTableViewCell.swift
//  Example
//
//  Created by Luis Padilla  on 2/11/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTiitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
