//
//  CoreDataManager.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Gentile")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    static func fetch<T>(_ request: NSFetchRequest<T>) -> [T] {
        do {
            let list = try persistentContainer.viewContext.fetch(request)
            return list
        } catch {
            print(error)
            return [T]()
        }
    }

    static func createObject(for entity: String, in context: NSManagedObjectContext) -> NSManagedObject? {
        var result: NSManagedObject?

        let description = NSEntityDescription.entity(forEntityName: entity, in: context)

        if let description = description {
            result = NSManagedObject(entity: description, insertInto: CoreDataManager.context)
        }

        return result
    }

    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("Context Saved")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
