//
//  ContactTableViewCell.swift
//  DemoProject
//
//  Created by Chaithra Shrikrishna on 08/08/20.
//  Copyright © 2020 Chaithra Shrikrishna. All rights reserved.
//

import Foundation
import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    func configureCell(name: String, phoneNumber: String) {
        self.fullNameLabel.text = name
        self.phoneNumberLabel.text = phoneNumber
    }
}
