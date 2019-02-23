//
//  ViewController.swift
//  Tarea3
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavigationBarButtonItem()
    }

    private func addRightNavigationBarButtonItem(){
        let backButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem(sender:)))
        navigationItem.rightBarButtonItem = backButton
    }
    
    
    @objc private func addItem(sender: UIBarButtonItem){
       // use UIAlertController
    }
}

