//
//  MemeSearchPresenter.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

protocol MemeSearchPresentationLogic {
    func presentDataSource(response : MemeSearch.DataSource.Response)
}

class MemeSearchPresenter: MemeSearchPresentationLogic {
  weak var viewController: MemeSearchDisplayLogic?
  
  // MARK: presenter logic
    func presentDataSource(response : MemeSearch.DataSource.Response) {
        if let error = response.error  {
            print("Hay un ERROR : \(error)")
            return
        }
       
        if let memes = response.items {
            
            let displayedMemes = memes.map({
                MemeSearch.DataSource.ViewModel.DisplayedItem.init(url : URL(string : $0.url), placeHolderImage : R.image.imageNotAvailable())
            })
            viewController?.displayDataSource(viewModel: MemeSearch.DataSource.ViewModel.init(displayedItems: displayedMemes))
        }
    }
}
