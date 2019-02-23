//
//  ContactListViewController.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var contactListTableView: UITableView!
    
    var viewModel: ContactListViewModel!
    weak var coordinator: ContactListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contactListTableView.delegate = self
        self.contactListTableView.dataSource = self
        self.contactListTableView.register(
            UINib(nibName: "ContactListTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactListCell")
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ContactDetailsViewController,
            let contact = sender as? Contact else { return }
        
        destination.viewModel = ContactDetailsViewModel(contact: contact)
    }
 
    @IBAction func addContactButtonPressed(_ sender: UIBarButtonItem) {
        self.coordinator?.createContact()
    }
    
}


// MARK: - UITableView delegate and data source implementation
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.contactCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell") as? ContactListTableViewCell else {
            fatalError("The dequeued cell is not an instance of ContactListTableViewCell.")
        }
        
        let current = self.viewModel.contact(at: indexPath)
        cell.contactNameLabel.text = current.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = self.viewModel.contact(at: indexPath)
        self.coordinator?.showDetails(of: contact)
    }
    
}
