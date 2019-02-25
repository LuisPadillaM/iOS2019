//
//  CategoriesViewController.swift
//  Clase4
//
//  Created by Cesar Brenes on 2/15/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import UIKit
import RealmSwift

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var categories: Results<Category>?
    private let customCellIdentifier = "CategoriesTableViewCell"
    private let customCellHeight: CGFloat = 200.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        loadCategories()
    }
    
    private func loadCategories() {
           
        RealmHelper.loadCategories { (categories) in
            if categories.isEmpty {
                saveCategoriesInRealm()
            }
            else{
                self.categories = categories
                tableView.reloadData()
            }
        }
    }
    
    private func saveCategoriesInRealm(){
        let economy = Category.init(value: ["name": "Economia", "image": "economy"])
        let accidents = Category.init(value: ["name": "Sucesos", "image": "incident"])
        let sports = Category.init(value: ["name": "Sports", "image": "sports"])
        let tecnology = Category.init(value: ["name": "Tecnology", "image": "technology"])
        let arrayToInsert = [economy, accidents, sports, tecnology]
        for category in arrayToInsert {
            RealmHelper.saveRealmObject(realmObject: category)
        }
        loadCategories()
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
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? CategoriesTableViewCell else {
            return UITableViewCell()
        }
        if let categories = categories {
            cell.setupCell(category: categories[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let category = categories?[indexPath.row]{
             goToAddNewsViewController(category: categories[indexPath.row])
        }
    }
}

extension CategoriesViewController: NewsViewControllerDelegate {
    func updateNews(identifier: UUID, news: [News]) {
//        if let indexArray =  categories.index(where: {$0.identifier == identifier}) {
//            var category = categories[indexArray]
//            category.news = news
//            categories[indexArray] = category
//        }
    }
}
