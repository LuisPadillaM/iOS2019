//
//  CategoriesViewController.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var categories = [Category]()
    private let customCellIdentifier = "CategoriesTableViewCell"
    private let customCellHeight: CGFloat = 200.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        initializeCategoriesArray()
    }
    
    private func initializeCategoriesArray(){
        let economy = Category.init(name: "Economia", image: "economy", news: [News]())
        let accidents = Category.init(name: "Sucesos", image: "incident", news: [News]())
        let sports = Category.init(name: "Sports", image: "sports", news: [News]())
        let tecnology = Category.init(name: "Tecnology", image: "technology", news: [News]())
        categories = [economy, accidents, sports, tecnology]
    }
    
    private func goToAddNewsViewController(category: Category) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController {
            viewController.category = category
            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}


extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func registerCustomCell() {
        let nib = UINib(nibName: customCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: customCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? CategoriesTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToAddNewsViewController(category: categories[indexPath.row])
    }
}

extension CategoriesViewController: NewsViewControllerDelegate {
    func updateNews(identifier: UUID, news: [News]) {
        if let indexArray =  categories.index(where: {$0.identifier == identifier}) {
            var category = categories[indexArray]
            category.news = news
            categories[indexArray] = category
        }
    }
}
