//
//  CardCollectionViewCell.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/23/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit
import Kingfisher


class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(item : MemoryGame.DataSource.ViewModel.DisplayedItem) {
        cardImage.kf.indicatorType = .activity
        let placeHolderImage = R.image.notFound()
        cardImage.kf.setImage(with: item.url, placeholder: placeHolderImage)
    }

}
