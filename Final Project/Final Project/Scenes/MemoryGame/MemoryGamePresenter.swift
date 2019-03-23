//
//  MemoryGamePresenter.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

protocol MemoryGamePresentationLogic {
     func presentDataSource(response : MemoryGame.DataSource.Response)
}

class MemoryGamePresenter: MemoryGamePresentationLogic {
  weak var viewController: MemoryGameDisplayLogic?
  // MARK: presenter logic
    func presentDataSource(response : MemoryGame.DataSource.Response) {
        
        if let error = response.error  {
            if let viewController = self.viewController as? UIViewController {
                ErrorHandlerWorker.showErrorAlertController(message : "\(error)", viewController : viewController)
            }
            
            return
        }
        
        if let memes = response.items {
            let displayedMemes = MemoryGameViewController.generateNewCards(memes : memes)
            viewController?.displayDataSource(viewModel: MemoryGame.DataSource.ViewModel.init(displayedItems: displayedMemes))
        }
    }
  
}
