//
//  Category.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import Foundation

struct Category {
    var name: String
    var image: String
    var news: [News]
    let identifier = UUID()
}
