//
//  MemeTableViewCell.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit
import Kingfisher

class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var memeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(item : MemeSearch.DataSource.ViewModel.DisplayedItem) {
        memeImageView.kf.indicatorType = .activity
        let placeHolderImage = R.image.imageNotAvailable()
        memeImageView.kf.setImage(with: item.url, placeholder: placeHolderImage)
    }
    
}
