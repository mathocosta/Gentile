//
//  ContactListCoordinator.swift
//  Gentile
//
//  Created by Matheus Costa on 22/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

class ContactListCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        let vc = ContactListViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = ContactListViewModel()
        
        self.navigationController.pushViewController(vc, animated: false)
    }

    func createContact() {
        let vc = ContactFormViewController.instantiate()
        let navController = UINavigationController(rootViewController: vc)
        
        vc.coordinator = self
        vc.viewModel = ContactFormViewModel()
        
        self.navigationController.present(navController, animated: true, completion: nil)
    }
    
    func showDetails(of contact: Contact) {
        let vc = ContactDetailsViewController.instantiate()
        
        vc.coordinator = self
        vc.viewModel = ContactDetailsViewModel(contact: contact)
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
