//
//  ContactListViewModel.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import Foundation
import CoreData

class ContactListViewModel: NSObject {
    
    lazy var fetchedResultController: NSFetchedResultsController<Contact> = {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        
        let controller = NSFetchedResultsController(
            fetchRequest: request, managedObjectContext: CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        return controller
    }()
    
    var contactCount: Int {
        guard let objects = self.fetchedResultController.fetchedObjects else { return 0 }
        
        return objects.count
    }
    
    override init() {
        super.init()
        
        do {
            try self.fetchedResultController.performFetch()
        } catch let fetchError {
            print(fetchError.localizedDescription)
        }
    }
    
    func contact(at indexPath: IndexPath) -> Contact {
        return self.fetchedResultController.object(at: indexPath)
    }
    
}


// MARK: - NSFetchedResultsControllerDelegate implementation
extension ContactListViewModel: NSFetchedResultsControllerDelegate {
    
}
