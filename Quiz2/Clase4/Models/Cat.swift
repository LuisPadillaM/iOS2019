//
//  Cat.swift
//  Clase4
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import Foundation
import RealmSwift

class Cat: Object {
    @objc dynamic var name = ""
    @objc dynamic var order = 0
    @objc dynamic var color = ""
    @objc dynamic var identifier = NSUUID().uuidString
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
}

