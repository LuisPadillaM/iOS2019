//
//  RealmHelper.swift
//  Clase4
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    class func saveRealmObject(realmObject: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmObject, update: true)
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    
    class func loadCategories(completionHandler : (_ categories : Results<Category>) ->Void) {
        do {
            let realm = try Realm()
            let categories = realm.objects(Category.self)
            completionHandler(categories)
        } catch let error as NSError {
            print("Error found trying to insert or update a posture Change: \(error)")
        }
        
    }
    
    class func addNewsToCategory(category : Category, news : News){
        do {
            let realm = try Realm()
            try realm.write {
                category.news.append(news)
                realm.add(category, update : true)
            }
        } catch let error as NSError {
            print("error trying to update or add \(error)")
        }
        
    }
    class  func deleteNews(category : Category, news : News) {
        do {
            let realm = try Realm()
            try realm.write {
                //category.news.remove()
            }
        }  catch let error as NSError {
            print("error trying to delete \(error)")
        }
    }
}
