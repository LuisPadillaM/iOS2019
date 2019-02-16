//
//  NewsTableViewCell.swift
//  Example
//
//  Created by Luis Padilla  on 2/11/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

protocol NewsTableViewCellDelegate : class {
    func btnDeleteClicked(cell : NewsTableViewCell)
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!

    weak var delegate : NewsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteBtnAction(_ sender: Any) {
        delegate?.btnDeleteClicked(cell : self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
