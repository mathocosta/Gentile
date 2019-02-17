//
//  ContactDetailsViewController.swift
//  Gentile
//
//  Created by Matheus Costa on 17/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    
    var viewModel: ContactDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.viewModel.nameText
        self.phoneLabel.text = self.viewModel.phoneText
        self.birthDateLabel.text = self.viewModel.birthDate
    }

}
