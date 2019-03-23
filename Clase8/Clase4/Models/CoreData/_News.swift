// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to News.swift instead.

import Foundation
import CoreData

public enum NewsAttributes: String {
    case body = "body"
    case createdAt = "createdAt"
    case title = "title"
}

public enum NewsRelationships: String {
    case category = "category"
}

open class _News: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "News"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _News.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var body: String?

    @NSManaged open
    var createdAt: Date?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var category: Category?

}

