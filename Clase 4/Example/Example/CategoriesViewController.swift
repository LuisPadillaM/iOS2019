//
//  CategoriesViewController.swift
//  Example
//
//  Created by Luis Padilla  on 2/10/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    let customTableIdentifier = "CategoryTableViewCell"
    let newsViewControllerIdentifier = "NewsViewController"
    
    let EconomyCategory = Category(name : "Economía", image :  "economy", news: [])
    let IncidentsCategory = Category(name : "Sucesos", image : "incident", news: [])
    let SportsCategory = Category(name : "Deportes", image : "sports", news : [])
    let TechnologyCategory = Category(name : "Tecnología", image : "technology", news : [])
    var Categories = [Category]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.Categories = [EconomyCategory, IncidentsCategory, SportsCategory, TechnologyCategory]
        registerCustomTableView()
    }


    func registerCustomTableView(){ // primero registro celda
        let nib = UINib(nibName: customTableIdentifier, bundle: nil)
        categoryTableView.register(nib, forCellReuseIdentifier : self.customTableIdentifier)
    }
    
    func goToCategoryNews(selectedCategory : Category){
        if let controller = storyboard?.instantiateViewController(withIdentifier: self.newsViewControllerIdentifier) as? NewsViewController{
            controller.currentCategory = selectedCategory
            navigationController?.pushViewController(controller, animated: true)
        }
    }


}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Categories.count
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.goToCategoryNews(selectedCategory : self.Categories[indexPath.row])
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.customTableIdentifier) as? CategoryTableViewCell else {
            return UITableViewCell()
        }

        let category = self.Categories[indexPath.row]
        cell.CategoryLabel.text = category.name
        cell.CategoryImage.image = UIImage(named:  category.image)
        return cell
    }
    
    
}
