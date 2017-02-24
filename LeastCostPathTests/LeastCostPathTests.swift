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

    let inputString1 = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5"
    let inputString2 = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n"
    let emptyString = ""
    let inputString4 = "\n"

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
    
    func testGetRows() {
        let rows1 = viewController.getRows(inputString: inputString1)
        let rows2 = viewController.getRows(inputString: inputString2)
        let rows3 = viewController.getRows(inputString: emptyString)
        let rows4 = viewController.getRows(inputString: inputString4)
        
        XCTAssertEqual(rows1, ["1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5"])
        XCTAssertEqual(rows2, ["1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5"])
        XCTAssertEqual(rows3, [])
        XCTAssertEqual(rows4, [])
    }
    
    func testGetColumns() {
        let rows1 = viewController.getRows(inputString: inputString1)
        let cols1 = viewController.getColumns(inputString: rows1.first!)
        
        XCTAssertEqual(cols1, ["1", "2", "3", "4", "5"])
        
        
        let cols2 = viewController.getColumns(inputString: emptyString)
        XCTAssertEqual(cols2, [])
    }
    
    func testGetRowsCount() {
        
        let rowsCount1 = viewController.getRowsCount(inputString: inputString1)
        let rowsCount2 = viewController.getRowsCount(inputString: inputString2)
        let rowsCount3 = viewController.getRowsCount(inputString: emptyString)
        let rowsCount4 = viewController.getRowsCount(inputString: inputString4)
        
        XCTAssertEqual(rowsCount1, 5)
        XCTAssertEqual(rowsCount2, 5)
        XCTAssertEqual(rowsCount3, 0)
        XCTAssertEqual(rowsCount4, 0)
    }
    
    func testGetColumnCount() {
        let colCount1 = viewController.getRowsCount(inputString: inputString1)
        let colCount2 = viewController.getRowsCount(inputString: inputString2)
        let colCount3 = viewController.getRowsCount(inputString: emptyString)
        let colCount4 = viewController.getRowsCount(inputString: inputString4)
        
        XCTAssertEqual(colCount1, 5)
        XCTAssertEqual(colCount2, 5)
        XCTAssertEqual(colCount3, 0)
        XCTAssertEqual(colCount4, 0)
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
    
    // Given a string input, tests if in the right format.
    func testInputValidity() {
        let validInput = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5"
        let invalidInput = ""
        
        XCTAssertTrue(viewController.isValidInput(input: validInput))
        XCTAssertFalse(viewController.isValidInput(input: invalidInput))
    }
}
