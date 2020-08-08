//
//  DemoProjectTests.swift
//  DemoProjectTests
//
//  Created by Chaithra Shrikrishna on 08/08/20.
//  Copyright © 2020 Chaithra Shrikrishna. All rights reserved.
//

import XCTest
@testable import DemoProject

class DemoProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class TestingViewControllerPropertiesTests: XCTestCase {
    var sut: ViewController?
    
    override func setUp() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testContactDetailsForm_WhenLoaded_TextFieldAreConnected() throws {
        _ = try XCTUnwrap(sut?.tableView, "The tableview is not connected")
    }
    
    func testSUT_HasRightBarButtonItem() {
        XCTAssertNotNil(sut?.navigationItem.rightBarButtonItem)
    }
    
    func testSUT_HasRightBarButtonItem_WithTarget_CorrectlyAssigned() {
        if let rightBarButtonItem = sut?.navigationItem.rightBarButtonItem {
            XCTAssertNotNil(rightBarButtonItem.target)
            XCTAssert(rightBarButtonItem.target === self.sut)
        }
        else {
            XCTAssertTrue(false)
        }
    }
    
    func testSUT_HasRightBarButtonItem_WithActionMethod_CorrectlyAssigned() {
        if let rightBarButtonItem = sut?.navigationItem.rightBarButtonItem {
            XCTAssertTrue(rightBarButtonItem.action?.description == "addButtonClicked:")
        }
        else {
            XCTAssertTrue(false)
        }
    }
}


class TestingAddContactDetailsViewControllerPropertiesTests: XCTestCase {
    var sut: AddContactDetailsViewController?
    
    override func setUp() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        
        sut = storyboard.instantiateViewController(withIdentifier: "AddContactDetailsViewController") as? AddContactDetailsViewController
        sut?.loadViewIfNeeded()
        
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testContactDetailsForm_WhenLoaded_TextFieldAreConnected() throws {
     _ = try XCTUnwrap(sut?.firstNameTextField, "The First Name UITextField is not connected")
     _ = try XCTUnwrap(sut?.lastNameTextField, "The Last Name UITextField is not connected")
     _ = try XCTUnwrap(sut?.phoneNumberTextField, "The phone number UITextField is not connected")
    }
}


class ContactTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInitialization() {
        let contact = Contact(firstName: "Chaithra", lastName: "TS", phoneNumber: "1234567")

        XCTAssertNotNil(contact)
        XCTAssertEqual(contact.firstName, "Chaithra")
        XCTAssertEqual(contact.lastName, "TS")
    }

    func testFullName() {
        let contact = Contact(firstName: "Chaithra", lastName: "TS", phoneNumber: "12345678")
        XCTAssertEqual(contact.fullName, "Chaithra TS")
    }

}
