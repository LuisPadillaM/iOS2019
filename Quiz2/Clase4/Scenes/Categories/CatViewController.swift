//
//  CatViewController.swift
//  
//
//  Created by Luis Padilla  on 2/23/19.
//

import UIKit
import RealmSwift

class CatViewController: UIViewController {

    @IBOutlet weak var catTableView: UITableView!
    private let customCellIdentifier = "CatTableViewCell"
    private let customCellHeight: CGFloat = 80.0
    
    private var cats: Results<Cat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        loadCats()
    }
    
    private func loadCats() {
        do {
            let realm = try Realm()
            let cats = realm.objects(Cat.self)
            if cats.isEmpty {
                saveCatInRealm()
            }
            else{
                self.cats = cats
                catTableView.reloadData()
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a posture Change: \(error)")
        }
        
    }
    
    
    private func saveCatInRealm(){
 
        var catsToInsert = [Cat]()
        for value in  0...10 {
            let cat = Cat.init(value : ["name" : "Cat \(value)", "color" : "#FFFFF\(value)", "order" : value])
            catsToInsert.append(cat)
        }
        for cat in catsToInsert {
            saveRealmObject(realmObject: cat)
        }
        loadCats()

    }
    
    
    private func saveRealmObject(realmObject: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmObject, update: true)
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    
}

extension CatViewController: UITableViewDelegate, UITableViewDataSource {
    private func registerCustomCell() {
        let nib = UINib(nibName: customCellIdentifier, bundle: nil)
        catTableView.register(nib, forCellReuseIdentifier: customCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? CatTableViewCell else {
            return UITableViewCell()
        }
        if let cats = cats {
            cell.setupCell(cat: cats[indexPath.row])
        }
        return cell
    }
}
