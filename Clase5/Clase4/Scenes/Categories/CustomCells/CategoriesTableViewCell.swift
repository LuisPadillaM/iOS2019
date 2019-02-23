//
//  CaategoriesTableViewCell.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupCell(category: Category) {
        titleLabel.text = category.name
        categoryImageView.image = UIImage(named: category.image)
    }
    
}
