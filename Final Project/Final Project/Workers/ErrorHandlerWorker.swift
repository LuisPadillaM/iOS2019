//
//  ErrorHandlerWorker.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class ErrorHandlerWorker
{

    static func showErrorAlertController(message : String, viewController : UIViewController) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
}

