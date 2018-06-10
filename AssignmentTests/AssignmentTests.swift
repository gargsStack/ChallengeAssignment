//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Vivek on 05/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    
    var loginVC = LoginViewController()
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        loginVC = storyBoard.instantiateViewController(withIdentifier: "loginVIew") as! LoginViewController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidationsForTextFields() {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let email = "test@gmail.com"
        let password = "Test@123"
        
        let result = self.loginVC.validateRequiredFields(email: email, password: password)
        
        XCTAssert(result)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
