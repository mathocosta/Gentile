//
//  ContactFormViewController.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

class ContactFormViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var birthDateField: UITextField!
    
    var viewModel: ContactFormViewModel!
    
    // BirthDate DatePicker configuration
    lazy var dateFieldPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(
            self, action: #selector(birthDateChanged(datePicker:)), for: .valueChanged)
        
        return picker
    }()
    
    // BirthDate Toolbar configuration
    lazy var pickerFieldToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarDoneAction))
        let spaceButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(
            title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarCancelAction))
        
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }()
    
    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ContactFormViewModel()
        
        self.birthDateField.text = self.viewModel.birthDateAsString
        self.birthDateField.inputView = self.dateFieldPicker
        self.birthDateField.inputAccessoryView = self.pickerFieldToolbar
    }
    
    // MARK: - Actions
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        guard let nameFieldText = self.nameField.text else {
            fatalError("NameField Empty")
        }
        
        guard let phoneFieldText = self.phoneField.text else {
            fatalError("PhoneField Empty")
        }
        
        guard let birthDateText = self.birthDateField.text else {
            fatalError("BirthField Empty")
        }
        
        self.viewModel.nameText = nameFieldText
        self.viewModel.phoneText = phoneFieldText
        self.viewModel.birthDate = self.viewModel.dateFormatter.date(from: birthDateText)!
        
        self.viewModel.saveContact()
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func birthDateChanged(datePicker: UIDatePicker) {
        self.birthDateField.text = self.viewModel.dateFormatter.string(from: datePicker.date)
    }
    
    @objc func toolbarDoneAction(sender: UIButton) {
        self.birthDateField.resignFirstResponder()
    }
    
    @objc func toolbarCancelAction(sender: UIButton) {
        self.birthDateField.text = self.viewModel.birthDateAsString
        self.birthDateField.resignFirstResponder()
    }
    
}
