//
//  MemoryGameInteractor.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

protocol MemoryGameBusinessLogic {
    func requestDataSource(request : MemoryGame.DataSource.Request)
}

protocol MemoryGameDataStore {
    //var name: String { get set }
}

class MemoryGameInteractor: MemoryGameBusinessLogic, MemoryGameDataStore {
    var presenter: MemoryGamePresentationLogic?
    var memoryWorker = MemoryGameWorker(store : MemesAPI())
    //var name: String = ""
    
    // MARK: Interactor logic
    func requestDataSource(request: MemoryGame.DataSource.Request) {
        let configuration = [ "rows" : request.rows, "columns" : request.columns ]
        memoryWorker.fetchMemes(configuration : configuration) { (memes, error) in
            let response = MemoryGame.DataSource.Response.init(items: memes, error: error)
            self.presenter?.presentDataSource(response: response)
        }
    }
}
