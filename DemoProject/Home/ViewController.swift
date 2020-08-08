//
//  ViewController.swift
//  DemoProject
//
//  Created by Chaithra Shrikrishna on 08/08/20.
//  Copyright © 2020 Chaithra Shrikrishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    private var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        callAddContactDetails()
    }
}

extension ViewController {
    private func callAddContactDetails() {
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddContactDetailsViewController") as? AddContactDetailsViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.addContactAction = { [weak self] contact in
                self?.contacts.append(contact)
                self?.contacts = self?.contacts.sorted { $0.fullName < $1.fullName } ?? [Contact]()
                self?.tableView.reloadData()
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


//MARK: Table view datasource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(className: ContactTableViewCell.self, for: indexPath)
        let contactDetails = contacts[indexPath.row]
        cell.configureCell(name: contactDetails.fullName, phoneNumber: contactDetails.phoneNumber)
        return cell
    }
}

//MARK: Table view delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
