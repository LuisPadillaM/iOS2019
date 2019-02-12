//
//  CategoryTableViewCell.swift
//  Example
//
//  Created by Luis Padilla  on 2/10/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var CategoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
