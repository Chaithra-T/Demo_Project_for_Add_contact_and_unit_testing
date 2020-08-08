//
//  Contact.swift
//  DemoProject
//
//  Created by Chaithra Shrikrishna on 08/08/20.
//  Copyright © 2020 Chaithra Shrikrishna. All rights reserved.
//

import Foundation

struct Contact {
    var firstName: String
    var lastName: String
    var fullName: String
    var phoneNumber: String
    
    
    init(firstName: String, lastName: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = self.firstName + " " + self.lastName
        self.phoneNumber = phoneNumber
    }
}

extension Contact: Comparable {
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.fullName < lhs.fullName
    }
    
    
}
