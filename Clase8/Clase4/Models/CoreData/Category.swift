import Foundation
import CoreData

@objc(Category)
open class Category: _Category {
	// Custom logic goes here.
    
    static let nameKey="nameKey"
    static let imageKey="imageKey"
    
    class func fetchAll(completionHandler : ([Category]) -> Void) {
        let managedContext = CoreDataHelper.sharedInstance.managedContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : Category.entityName())
        do {
            if let categories = try managedContext.fetch(fetchRequest) as? [Category] {
                completionHandler(categories)
            }
        } catch let error as NSError {
            print("Error trying to get the categories \(error)")
            completionHandler([Category]())
        }
    }
    
    class func insert(categoryDictionary : [String : Any], completionHandler : (Constants.CoreDataError?) -> Void) {
        let managedContext = CoreDataHelper.sharedInstance.managedContext
        if let entity = NSEntityDescription.entity(forEntityName: Category.entityName(), in: managedContext), let category = NSManagedObject(entity :entity, insertInto : managedContext) as? Category {
            category.name = categoryDictionary[Category.nameKey] as? String
            category.image = categoryDictionary[Category.imageKey] as? String
            
            do{
                try managedContext.save()
                completionHandler(nil)
            } catch let error as NSError {
                print("NO SE PUDO GUARDAR EL OBJECTO \(error)")
                completionHandler(Constants.CoreDataError.insertFailed)
            }
        }
    }
}
