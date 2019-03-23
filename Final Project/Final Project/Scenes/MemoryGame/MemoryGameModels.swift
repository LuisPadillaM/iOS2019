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
            struct DisplayedItem {
                var url : URL?
                var placeHolderImage : UIImage?
            }
            var displayedItems : [DisplayedItem]
        }
    }
}

