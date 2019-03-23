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
    
    func setupCellInitialCells(item : MemoryGame.DataSource.ViewModel.CardItem) {
        if  let hidenImage = R.image.hiddenImage() {
            cardImage.image = hidenImage
        }
    }
    
    func setupCell(item : MemoryGame.DataSource.ViewModel.CardItem) {
        let hidenImage = R.image.hiddenImage()
        let placeHolderImage = R.image.notFound()
            // cardImageView.alpha = cardState.isAlreadyGuessed || cardState.isFlipped ? 1 : 0
        if(item.isFlipped || item.isAlreadyGuessed){
            cardImage.kf.indicatorType = .activity
            cardImage.kf.setImage(with: item.url, placeholder: placeHolderImage)
        } else {
            cardImage.image = hidenImage;
        }
       
    }

}
