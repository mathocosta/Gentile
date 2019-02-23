//
//  ContactDetailsViewModel.swift
//  Gentile
//
//  Created by Matheus Costa on 17/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import Foundation

class ContactDetailsViewModel: NSObject {

    private var contact: Contact

    var nameText: String {
        return self.contact.name!
    }

    var phoneText: String {
        return self.contact.phone!
    }

    var birthDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"

        return formatter.string(from: self.contact.birth!)
    }

    init(contact: Contact) {
        self.contact = contact
    }
}
