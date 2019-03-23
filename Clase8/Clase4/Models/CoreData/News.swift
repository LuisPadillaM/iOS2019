import Foundation
import CoreData

@objc(News)
open class News: _News {
    
    static let bodyKey="bodyKey"
    static let creatAtKey="creatAtKey"
    static let titleKey="titleKey"
    
	// Custom logic goes here.
    class func insert(newsDictionary : [String : Any], category : Category, completionHandler : (Constants.CoreDataError?) -> Void) {
        let managedContext = CoreDataHelper.sharedInstance.managedContext
        if let entity = NSEntityDescription.entity(forEntityName: News.entityName(), in: managedContext), let news = NSManagedObject(entity :entity, insertInto : managedContext) as? News {
            
            news.body = newsDictionary[News.bodyKey] as? String
            news.createdAt = newsDictionary[News.creatAtKey] as? Date
            news.title = newsDictionary[News.titleKey] as? String
            news.category = category
            
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
