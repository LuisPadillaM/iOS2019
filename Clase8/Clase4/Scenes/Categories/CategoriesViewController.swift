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
    
    
    override func viewDidLoad() { // SE LLAMA una unica vez
        super.viewDidLoad()
        registerCustomCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCategories()
    }
    
    private func loadCategories() {
        Category.fetchAll { (categories)  in
            if categories.isEmpty {
                insertCategories()
            } else {
                self.categories = categories
                tableView.reloadData()
            }
        }
    }
    
    private func insertCategories(){
        var categoriesDictionary = [[String : Any]]()
        categoriesDictionary.append([Category.nameKey : "Economía", Category.imageKey : "economy"])
             categoriesDictionary.append([Category.nameKey : "Sucesos", Category.imageKey : "incident"])
          categoriesDictionary.append([Category.nameKey : "Sports", Category.imageKey : "sports"])
             categoriesDictionary.append([Category.nameKey : "Tecnology", Category.imageKey : "technology"])
//        let economy = Category.init(name: "Economia", image: "economy", news: [News]())
//        let accidents = Category.init(name: "Sucesos", image: "incident", news: [News]())
//        let sports = Category.init(name: "Sports", image: "sports", news: [News]())
//        let tecnology = Category.init(name: "Tecnology", image: "technology", news: [News]())
        // categories = [economy, accidents, sports, tecnology]
        insertCategoryArray(categories : categoriesDictionary)
    }
    
    private func insertCategoryArray(categories : [[String : Any]]) {
        if categories.isEmpty {
            print("just once")
            loadCategories()
            return
        }
        
        var categoriesMutable = categories
        Category.insert(categoryDictionary : categoriesMutable.first!){ (error) in
            guard let _ = error else {
                categoriesMutable.removeFirst()
                insertCategoryArray(categories: categoriesMutable)
                return
            }

    
        }
    }
    
    private func goToAddNewsViewController(category: Category) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController {
            viewController.category = category
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
