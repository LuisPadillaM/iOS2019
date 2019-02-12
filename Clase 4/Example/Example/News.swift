//
//  News.swift
//  Example
//
//  Created by Luis Padilla  on 2/10/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import Foundation

class News {
    var createdAt : Date
    var title : String
    var body : String
    
    init(createdAt : Date, title : String, body : String){
        self.createdAt = createdAt
        self.title = title
        self.body = body
    }
}
