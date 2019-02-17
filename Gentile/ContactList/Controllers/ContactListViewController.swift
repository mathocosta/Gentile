//
//  ContactListViewController.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet weak var contactListTableView: UITableView!
    
    var viewModel: ContactListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ContactListViewModel()
        
        self.contactListTableView.delegate = self
        self.contactListTableView.dataSource = self
        self.contactListTableView.register(
            UINib(nibName: "ContactListTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactListCell")
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        performSegue(withIdentifier: "DisplayContactSegue", sender: indexPath)
    }
    
}
