//
//  MemeSearchInteractor.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

protocol MemeSearchBusinessLogic {
    func requestDataSource(request : MemeSearch.DataSource.Request)
}

protocol MemeSearchDataStore {
    //var name: String { get set }
}

class MemeSearchInteractor: MemeSearchBusinessLogic, MemeSearchDataStore {
    var presenter: MemeSearchPresentationLogic?
    var worker = MemeSearchWorker()
    var memeWorker = MemeWorker(store : MemesAPI())
    //var name: String = ""
    
    // MARK: Interactor logic
    func requestDataSource(request : MemeSearch.DataSource.Request) {
        memeWorker.fetchMemes(searchCriteria : request.criteria) { (memes, error) in
            let response = MemeSearch.DataSource.Response.init(items: memes, error: error)
            self.presenter?.presentDataSource(response: response)
        }
    }
}
