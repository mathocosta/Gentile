//
//  ContactFormViewModel.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import Foundation

class ContactFormViewModel: NSObject {
    
    private var contact: Contact!
    
    var nameText: String
    var phoneText: String
    var birthDate: Date
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }
    
    var birthDateAsString: String {
        return self.dateFormatter.string(from: self.birthDate)
    }
    
    override init() {
        self.nameText = ""
        self.phoneText = ""
        self.birthDate = Date()
    }
    
    init(contact: Contact) {
        self.contact = contact
        self.nameText = contact.name!
        self.phoneText = contact.phone!
        self.birthDate = contact.birth!
    }
    
    func saveContact() {
        guard let contact = CoreDataManager.createObject(for: "Contact", in: CoreDataManager.context) else {
            return
        }
        
        contact.setValue(self.nameText, forKey: "name")
        contact.setValue(self.phoneText, forKey: "phone")
        contact.setValue(self.birthDate, forKey: "birth")
        
        CoreDataManager.saveContext()
    }
}
