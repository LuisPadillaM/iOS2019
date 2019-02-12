//
//  Category.swift
//  Example
//
//  Created by Luis Padilla  on 2/10/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import Foundation

class Category  {
    var name : String
    var image : String
    var news : [News]
    
    init(name : String, image : String, news : [News]){
        self.name = name
        self.image = image
        self.news = news
    }
}
