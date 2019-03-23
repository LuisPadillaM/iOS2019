//
//  MemoryGameModels.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

enum MemoryGame {
    
    enum DataSource {
        struct Request {
            var rows    : Int
            var columns : Int
        }
        struct  Response {
            var items : [Meme]?
            var error : ServiceError?
        }
        struct ViewModel {
            struct CardItem {
                var id :  Int
                var url : URL?
                var placeHolderImage : UIImage?
                var isAlreadyGuessed = false
                var isFlipped = false
                
                init(id: Int, url: URL?, placeHolderImage : UIImage?, isAlreadyGuessed : Bool = false, isFlipped : Bool = false) {
                    self.id = id
                    self.url = url
                    self.placeHolderImage = placeHolderImage
                    self.isAlreadyGuessed = isAlreadyGuessed
                     self.isFlipped = isFlipped
                }
            }
            var displayedItems : [CardItem]
        }
    }
}

