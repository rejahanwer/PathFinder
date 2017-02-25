//
//  LCPModelTests.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah (Contractor) on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import XCTest
@testable import LeastCostPath

class LCPModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGridInitialization() {
        // Given an input string, get a Grid model class initialized.
        let grid1 = Grid(inputString: inputString1)
        let grid2 = Grid(inputString: inputString2)
        let grid3 = Grid(inputString: inputString3)
        let grid4 = Grid(inputString: emptyString)
        
        // Nil tests
        XCTAssertNotNil(grid1)
        XCTAssertNotNil(grid2)
        XCTAssertNil(grid3)
        XCTAssertNil(grid4)
        
        XCTAssertEqual(grid1!.rowCount, 5)
        XCTAssertEqual(grid2!.rowCount, 5)
        XCTAssertEqual(grid1!.colCount, 5)
        XCTAssertEqual(grid2!.colCount, 5)
        
        XCTAssertEqual(grid1!.valueAt(i: 0, j: 0), 1)
        XCTAssertEqual(grid1!.valueAt(i: 0, j: 1), 2)
        XCTAssertEqual(grid1!.valueAt(i: 0, j: 2), 3)
        XCTAssertEqual(grid1!.valueAt(i: 0, j: 3), 4)
        XCTAssertEqual(grid1!.valueAt(i: 0, j: 4), 5)
        
        XCTAssertEqual(grid1!.valueAt(i: 0, j: 0), 1)
        XCTAssertEqual(grid1!.valueAt(i: 1, j: 0), 1)
        XCTAssertEqual(grid1!.valueAt(i: 2, j: 0), 1)
        XCTAssertEqual(grid1!.valueAt(i: 3, j: 0), 1)
        XCTAssertEqual(grid1!.valueAt(i: 4, j: 0), 1)
    }
    
    func testGetLastColumn() {
        let grid1 = Grid(inputString: inputString1)
        let lastColArray = grid1?.getLastColumn()
        
        XCTAssertNotNil(lastColArray)
        XCTAssertEqual(lastColArray!, [5, 5, 5, 5, 5])
    }
}
