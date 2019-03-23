//
//  Meme.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import Foundation

struct Meme {
    var url : String
    var id : Int
    init(dictionary : [String : Any]){
        self.url = dictionary[APIKeys.Meme.imageURL] as? String ?? ""
        self.id = dictionary[APIKeys.Meme.imageId] as? Int ?? -1
    }
    
    init(url : String, id : Int){
        self.url = url
        self.id = id
    }
}
