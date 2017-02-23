//
//  LeastCostPathTests.swift
//  LeastCostPathTests
//
//  Created by Anuvar, Rejah (Contractor) on 2/23/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import XCTest
@testable import LeastCostPath


class LeastCostPathTests: XCTestCase {

    var viewController: LCPViewController!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = LCPViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    func testEmptyInput() {
        let emptyString = ""
        let nonEmptyString = "1"
        
        XCTAssertTrue(viewController.isEmptyString(string: emptyString))
        XCTAssertFalse(viewController.isEmptyString(string: nonEmptyString))
    }
    
    func testNonNumericInput() {
        let nonNumericString = "a b c\n"
        let numericString = "1 2 3\n"
        
        XCTAssertTrue(viewController.hasNonNumerics(string: nonNumericString))
        XCTAssertFalse(viewController.hasNonNumerics(string: numericString))
    }
    
    // Test if rows between 1 - 10.
    func testGridRowSizeValidity() {
        // 1 Row
        let validInput1 = "1 2 3 4 5"
        // 10 Rows
        let validInput2 = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5"
        // 0 Rows
        let invalidInput1 = ""
        // 11 Rows
        let invalidInput2 = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n 1 2 3 4 5"
        
        XCTAssertTrue(viewController.validateRowSize(input: validInput1))
        XCTAssertTrue(viewController.validateRowSize(input: validInput2))
        XCTAssertFalse(viewController.validateRowSize(input: invalidInput1))
        XCTAssertFalse(viewController.validateRowSize(input: invalidInput2))
    }

    // Test if columns between 5 - 100.
    func testGridColumnSizeValidity() {
        // 5 Columns
        let validInput1 = "1 2 3 4 5"
        // 100 Columns
        let validInput2 = "1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5"
        
        let invalidInput1 = "1 2 3 4"
        let invalidInput2 = "1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 101"
        
        XCTAssertTrue(viewController.validateColumnSize(input: validInput1))
        XCTAssertTrue(viewController.validateColumnSize(input: validInput2))
        XCTAssertFalse(viewController.validateColumnSize(input: invalidInput1))
        XCTAssertFalse(viewController.validateColumnSize(input: invalidInput2))
    }
    
    func testGridSizeColumnValidity() {
    }
    
    // Given a string input, tests if in the right format.
    func testInputValidity() {
        let validInput = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5"
        let invalidInput = ""
        
        XCTAssertTrue(viewController.isValidInput(input: validInput))
        XCTAssertFalse(viewController.isValidInput(input: invalidInput))
    }
}
