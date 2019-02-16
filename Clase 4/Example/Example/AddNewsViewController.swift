//
//  AddNewsViewController.swift
//  Example
//
//  Created by Luis Padilla  on 2/11/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

protocol AddNewsViewControllerDelegate : class {
    func addNews(news : News)
}

extension AddNewsViewControllerDelegate {
    func addNews(news : News) {}
}

class AddNewsViewController: UIViewController {
    
    @IBOutlet weak var newsTitle: UITextField!
    @IBOutlet weak var newsBody: UITextView!
    weak var delegate : AddNewsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func saveNewsElement(_ sender: Any) {
        if let title = newsTitle.text, let body = newsBody.text, title.count > 0, body.count > 0 {
            self.addNews(title : title, body : body)
        } else {
            showAlertController();
        }
    }
    
    func addNews(title : String, body : String) {
        let news = News(createdAt : Date(), title: title, body : body)
        delegate?.addNews(news: news)
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title : "Error", message : "Debe llenar todos los campos", preferredStyle : .alert)
        
        let action = UIAlertAction(title : "OK", style : .default) { (_) in
            self.newsTitle.becomeFirstResponder()
        }
        alertController.addAction(action)
        present(alertController, animated : true, completion: nil)
    }

}
