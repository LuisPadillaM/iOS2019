//
//  MemesMemory.swift
//  Clase 6
//
//  Created by Luis Padilla  on 3/2/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit

class MemesMemory: MemeStoreProtocol {
    func fetchMemes(searchCriteria: String, completionHandler: @escaping ([Meme]?, ServiceError?) -> Void) {
        completionHandler([
            Meme.init(url : "https://memegenerator.net/img/images/166088.jpg", id : 1),
            Meme.init(url : "https://memegenerator.net/img/images/4796874.jpg", id : 2)
            ], nil)
    }
    

}
