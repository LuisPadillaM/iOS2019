//
//  AddNewsViewController.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit

protocol NewsViewControllerDelegate: class {
    func updateNews(identifier: UUID, news: [News])
}

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let customCellIdentifier = "NewsTableViewCell"
    var category: Category?
    weak var delegate: NewsViewControllerDelegate?
    private let customCellHeight: CGFloat = 90.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        registerCustomCell()
        addRightNavigationBarButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func addRightNavigationBarButtonItem(){
        let backButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem(sender:)))
        navigationItem.rightBarButtonItem = backButton
    }
    
    @objc private func addItem(sender: UIBarButtonItem){
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "AddNewsViewController") as? AddNewsViewController {
            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    private func registerCustomCell() {
        let nib = UINib(nibName: customCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: customCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = category else {
            return 0
        }
        return category.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        if let category = category {
          cell.setupCell(news: category.news[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if let category = category {
                  RealmHelper.deleteNews(news : category.news[indexPath.row])
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    
    private func updateCategoryDataSource() {
//        if let category = category {
//            delegate?.updateNews(identifier: category.identifier, news: category.news)
//        }
    }
}

extension NewsViewController: AddNewsViewControllerDelegate {
    func addNews(news: News) {
        if let category = category {
            RealmHelper.addNewsToCategory(category: category, news: news)
        }
    }
}
