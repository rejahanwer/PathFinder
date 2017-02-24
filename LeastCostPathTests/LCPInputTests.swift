//
//  LeastCostPathTests.swift
//  LeastCostPathTests
//
//  Created by Anuvar, Rejah (Contractor) on 2/23/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import XCTest
@testable import LeastCostPath

class LCPInputTests: XCTestCase {
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
    
    func testNonNumericInput() {
        let nonNumericString = "a b c\n"
        let numericString = "1 2 3\n"
        
        XCTAssertTrue(nonNumericString.hasNonNumerics)
        XCTAssertFalse(numericString.hasNonNumerics)
    }
    
    func testGetRows() {
        let rows1 = Utility.getRows(inputString: inputString1)
        let rows2 = Utility.getRows(inputString: inputString2)
        let rows3 = Utility.getRows(inputString: inputString3)
        let rows4 = Utility.getRows(inputString: emptyString)
        
        
        XCTAssertEqual(rows1, ["1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5"])
        XCTAssertEqual(rows2, ["1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5", "1 2 3 4 5"])
        XCTAssertEqual(rows3, [])
        XCTAssertEqual(rows4, [])
    }
    
    func testGetColumns() {
        let rows1 = Utility.getRows(inputString: inputString1)
        let cols1 = Utility.getColumns(inputString: rows1.first!)
        
        XCTAssertEqual(cols1, [1, 2, 3, 4, 5])
        
        
        let cols2 = Utility.getColumns(inputString: emptyString)
        XCTAssertEqual(cols2, [])
    }
    
    func testGetRowsCount() {
        
        let rowsCount1 = Utility.getRowsCount(inputString: inputString1)
        let rowsCount2 = Utility.getRowsCount(inputString: inputString2)
        let rowsCount3 = Utility.getRowsCount(inputString: inputString3)
        let rowsCount4 = Utility.getRowsCount(inputString: emptyString)
        
        XCTAssertEqual(rowsCount1, 5)
        XCTAssertEqual(rowsCount2, 5)
        XCTAssertEqual(rowsCount3, 0)
        XCTAssertEqual(rowsCount4, 0)
    }
    
    func testGetColumnCount() {
        let colCount1 = Utility.getRowsCount(inputString: inputString1)
        let colCount2 = Utility.getRowsCount(inputString: inputString2)
        let colCount3 = Utility.getRowsCount(inputString: inputString3)
        let colCount4 = Utility.getRowsCount(inputString: emptyString)
        
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
        
        XCTAssertTrue(Utility.validateRowSize(input: validInput1))
        XCTAssertTrue(Utility.validateRowSize(input: validInput2))
        XCTAssertFalse(Utility.validateRowSize(input: invalidInput1))
        XCTAssertFalse(Utility.validateRowSize(input: invalidInput2))
    }

    // Test if columns between 5 - 100.
    func testGridColumnSizeValidity() {
        // 5 Columns
        let validInput1 = "1 2 3 4 5"
        // 100 Columns
        let validInput2 = "1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5"
        
        let invalidInput1 = "1 2 3 4"
        let invalidInput2 = "1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 101"
        
        XCTAssertTrue(Utility.validateColumnSize(input: validInput1))
        XCTAssertTrue(Utility.validateColumnSize(input: validInput2))
        XCTAssertFalse(Utility.validateColumnSize(input: invalidInput1))
        XCTAssertFalse(Utility.validateColumnSize(input: invalidInput2))
    }
    
    // Given a string input, tests if in the right format.
    func testInputValidity() {
        let validInput1 = inputString1
        let validInput2 = inputString2
        let invalidInput1 = emptyString
        let invalidInput2 = inputString3
        
        XCTAssertTrue(Utility.isValidInput(input: validInput1))
        XCTAssertTrue(Utility.isValidInput(input: validInput2))
        XCTAssertFalse(Utility.isValidInput(input: invalidInput1))
        XCTAssertFalse(Utility.isValidInput(input: invalidInput2))
    }
}
