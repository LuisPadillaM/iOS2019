//
//  AddNewsTableViewCell.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(news: News) {
        titleLabel.text = news.title
        dateLabel.text = news.createdAt?.getFormatted(dateStyle: .medium, timeStyle: .short)
    }
}


extension Date {
    func getFormatted(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        let localizedDate = formatter.string(from: self as Date)
        return localizedDate
    }
}
