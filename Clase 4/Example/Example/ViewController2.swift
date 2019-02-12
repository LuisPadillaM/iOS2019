//
//  ViewController2.swift
//  Example
//
//  Created by Cesar Brenes on 2/3/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    var copyOfStringArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavigationBarButtonItem()
        
        
        for string in copyOfStringArray{
            print("\(string)")
        }
        
    }
    
    func addRightNavigationBarButtonItem(){
        let backButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(goToBackView(sender:)))
        navigationItem.rightBarButtonItem = backButton
    }
    
    
    @objc func goToBackView(sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
}
