//
//  News.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import Foundation
import RealmSwift

class News: Object {
    @objc dynamic var createAt = Date()
    @objc dynamic var title = ""
    @objc dynamic var body = ""
    let category = LinkingObjects(fromType: Category.self, property: "news")
}

