//
//  ViewController.swift
//  Tarea3
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var shopListTableView: UITableView!
    
    private var shopListItems: Results<ShoppingItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavigationBarButtonItem()
        loadShopItems()
    }
    
    private func saveRealmObject(realmObject: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmObject)
                  self.shopListTableView.reloadData()
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    
    private func deleteRealObject(realmObject : Object) {
          do {
             let realm = try Realm()
            try realm.write {
                realm.delete(realmObject)
            }
          } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    
    private func loadShopItems() {
        do {
            let realm = try Realm()
            let shopListItems = realm.objects(ShoppingItem.self).sorted(byKeyPath: "date",  ascending: false)
            if !shopListItems.isEmpty {
                self.shopListItems = shopListItems
                shopListTableView.reloadData()
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a posture Change: \(error)")
        }
        
    }

    private func addRightNavigationBarButtonItem(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem(sender:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func displayAlert(){
        let alertController = UIAlertController(title: "Add Shopping list item", message: "Please input shopping item title", preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            if let textField = alertController.textFields?.first, let text = textField.text {
                let newShoppingItem = ShoppingItem.init(value : ["title" : text])
                print("Text =>" + text)
                self.saveRealmObject(realmObject: newShoppingItem)
            }
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter your title"
        }
        
        alertController.addAction(action)
        self.present(alertController, animated:true, completion: nil)
    }
    
    
    @objc private func addItem(sender: UIBarButtonItem){
        displayAlert()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopListItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        if let shopListItems = shopListItems {
              cell.textLabel?.text = shopListItems[indexPath.row].title
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.05
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if let shopListItems = shopListItems {
                  self.deleteRealObject(realmObject : shopListItems[indexPath.row])
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("LA CELDA CON EL INDEX \(indexPath.row) fue presionada")
    }
}

