//
//  CategoriesViewController.swift
//  Example
//
//  Created by Luis Padilla  on 2/10/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
     @IBOutlet weak var categoriesTableView: UITableView!
    
    let customTableIdentifier = "CategoryTableViewCell"
    let EconomyCategory = Category(name : "Economía", image :  "economy", news: [])
    let IncidentsCategory = Category(name : "Sucesos", image : "incident", news: [])
    let SportsCategory = Category(name : "Deportes", image : "sports", news : [])
    let TechnologyCategory = Category(name : "Tecnología", image : "technology", news : [])
    var Categories = [Category]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomTableView()
        Categories = [EconomyCategory, IncidentsCategory, SportsCategory, TechnologyCategory]
    }


    func registerCustomTableView(){ // primero registro celda
        let nib = UINib(nibName: customTableIdentifier, bundle: nil)
        categoriesTableView.register(nib, forCellReuseIdentifier : self.customTableIdentifier)
    }


}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Categories.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.customTableIdentifier) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.CategoryLabel.text = Categories[indexPath.row].name
        // cell.CategoryImage = UIImage(named:  Categories[indexPath.row].image)
        return cell
    }
    
    
}
