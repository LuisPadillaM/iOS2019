//
//  MemeSearchInteractor.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

protocol MemeSearchBusinessLogic {

}

protocol MemeSearchDataStore {
    //var name: String { get set }
}

class MemeSearchInteractor: MemeSearchBusinessLogic, MemeSearchDataStore {
    var presenter: MemeSearchPresentationLogic?
    var worker = MemeSearchWorker()
    //var name: String = ""
    
    // MARK: Interactor logic
}
