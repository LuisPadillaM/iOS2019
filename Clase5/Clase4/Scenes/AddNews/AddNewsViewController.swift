//
//  NewsViewController.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit

protocol AddNewsViewControllerDelegate: class {
    func addNews(news: News)
}

class AddNewsViewController: UIViewController {

    weak var delegate: AddNewsViewControllerDelegate?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavigationBarButtonItem()
    }
    
    private func addRightNavigationBarButtonItem(){
        let backButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addItem(sender:)))
        navigationItem.rightBarButtonItem = backButton
    }
    
    @objc private func addItem(sender: UIBarButtonItem){
        if let title = titleTextField.text, let body = bodyTextView.text, title.count > 0, body.count > 0 {
            let news = News.init(createAt: Date(), title: title, body: body)
            delegate?.addNews(news: news)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
}
