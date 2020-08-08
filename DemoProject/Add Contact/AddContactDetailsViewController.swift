//
//  AddContactDetailsViewController.swift
//  DemoProject
//
//  Created by Chaithra Shrikrishna on 08/08/20.
//  Copyright © 2020 Chaithra Shrikrishna. All rights reserved.
//

import Foundation
import UIKit

class AddContactDetailsViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var addContactButton: UIButton!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    typealias ActionHandler = (Contact) -> ()
    var addContactAction: ActionHandler?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addToContactButtonClicked(_ sender: UIButton) {
        let contact = getContact()
        addContactAction?(contact)
        navigationController?.popViewController(animated: true)
    }
    
    private func getContact() -> Contact {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let phoneNumber = phoneNumberTextField.text ?? ""
        return Contact.init(firstName:firstName, lastName: lastName, phoneNumber: phoneNumber)
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
       let userInfo = notification.userInfo!
       var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
       keyboardFrame = self.view.convert(keyboardFrame, from: nil)

       var contentInset:UIEdgeInsets = scrollView.contentInset
       contentInset.bottom = keyboardFrame.size.height
       scrollView.contentInset = contentInset
     }

     @objc func keyboardWillHide(notification:NSNotification){

       let contentInset:UIEdgeInsets = UIEdgeInsets.zero
       scrollView.contentInset = contentInset
     }
}
