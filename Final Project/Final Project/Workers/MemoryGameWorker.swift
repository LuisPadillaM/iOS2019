//
//  MemeWorker.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MemoryGameWorker
{
    var store : MemeStoreProtocol
    
    init(store : MemeStoreProtocol) {
        self.store = store
    }
    
    func fetchMemes(configuration : [String : Int], completionHandler : @escaping([Meme]?, ServiceError?) -> Void) {
        store.fetchMemes(configuration: configuration, completionHandler: completionHandler)
    }
}

protocol MemeStoreProtocol {
    func fetchMemes(configuration : [String : Int], completionHandler : @escaping([Meme]?, ServiceError?) -> Void)
}