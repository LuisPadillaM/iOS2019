//
//  ViewController.swift
//  Example
//
//  Created by Cesar Brenes on 2/3/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var stringArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goToNextView(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2{
            controller.copyOfStringArray = stringArray
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}

