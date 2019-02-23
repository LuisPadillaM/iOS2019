//
//  CatTableViewCell.swift
//  Clase4
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var catName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(cat: Cat) {
        catName.text = cat.name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
