//
//  MemeSearchModels.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

enum MemeSearch {
    
    enum DataSource {
        struct Request {
            var criteria : String
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
    // MARK: Use cases
//    enum Something {
//        struct Request {
//        }
//        struct Response {
//        }
//        struct ViewModel {
//        }
//    }
}
