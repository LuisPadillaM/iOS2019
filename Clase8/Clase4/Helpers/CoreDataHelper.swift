//
//  CoreDataHelper.swift
//  Clase4
//
//  Created by Luis Padilla  on 3/9/19.
//  Copyright © 2019 Veux. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper : NSObject {
    static let sharedInstance = CoreDataHelper() // hace que clase sea singleton
    private override init() { // impide hacer instancias
        
    }
    
    lazy var persistentContainer : NSPersistentContainer  = { // se instancia hasta que se acceda a la propiedad
        let container = NSPersistentContainer(name : "Model") // se llama igual al archivo que genero core data si difiere no va a levantar
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Al hacer uso de fatal error el app va a crashear esto no es recomendable hacerlo en production \(error)")
            }
        })
        return container
    }()
    
    var managedContext : NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        }
    }
    
    func saveContext(completionHandler : (Constants.CoreDataError?) -> Void) {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completionHandler(nil)
            } catch {
                 completionHandler(Constants.CoreDataError.noSpaceAvailable)
                fatalError("Error guardando en disco")
            }
        }
    }
}

struct Constants {
    enum CoreDataError{
        case noSpaceAvailable
        case insertFailed 
    }
}
