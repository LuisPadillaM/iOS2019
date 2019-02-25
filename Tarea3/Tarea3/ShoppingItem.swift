//
//  ShoppingItem.swift
//  Tarea3
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import Foundation
import RealmSwift

class ShoppingItem : Object {
    
    @objc dynamic var date = Date()
    @objc dynamic var title = ""
}
