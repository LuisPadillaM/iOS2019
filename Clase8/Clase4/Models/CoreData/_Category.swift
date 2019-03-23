// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Category.swift instead.

import Foundation
import CoreData

public enum CategoryAttributes: String {
    case image = "image"
    case name = "name"
}

public enum CategoryRelationships: String {
    case news = "news"
}

open class _Category: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Category"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Category.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var image: String?

    @NSManaged open
    var name: String?

    // MARK: - Relationships

    @NSManaged open
    var news: NSSet

    open func newsSet() -> NSMutableSet {
        return self.news.mutableCopy() as! NSMutableSet
    }

}

extension _Category {

    open func addNews(_ objects: NSSet) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.news = mutable.copy() as! NSSet
    }

    open func removeNews(_ objects: NSSet) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.news = mutable.copy() as! NSSet
    }

    open func addNewsObject(_ value: News) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.news = mutable.copy() as! NSSet
    }

    open func removeNewsObject(_ value: News) {
        let mutable = self.news.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.news = mutable.copy() as! NSSet
    }

}

