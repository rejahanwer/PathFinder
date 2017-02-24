//
//  LCPManagerTests.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah (Contractor) on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import XCTest
@testable import LeastCostPath

class LCPManagerTests: XCTestCase {
    
    let testCase0 = "1 2 3 4 5 6\n2 2 3 4 5 6\n3 2 3 4 5 6\n1 2 3 4 5 6\n3 2 3 4 5 6"
    let testCase1 = "3 4 1 2 8 6\n6 1 8 2 7 4\n5 9 3 9 9 5\n8 4 1 3 2 6\n3 7 2 8 6 4"
    let testCase2 = "3 4 1 2 8 6\n6 1 8 2 7 4\n5 9 3 9 9 5\n8 4 1 3 2 6\n3 7 2 1 2 3"
    let testCase3_noPath = "19 10 19 10 19\n21 23 20 19 12\n20 12 20 11 10"
    let testCase4_1by5 = "5 8 5 3 5"
    let testCase5_5by1 = "5\n8\n5\n3\n5"
    let testCase6_nonNumeric = "5 4 H\n8 M 7\n5 7 5"
    let testCase7_noInput = ""
    let testCase8 = "69 10 19 10 19\n51 23 20 19 12\n60 12 20 11 10"
    let testCase9 = "60 3 3 6\n6 3 7 9\n5 6 8 3"
    let testCase10_negativeValues = "6 3 -5 9\n -5 2 4 10\n3 -2 6 10\n6 -1 -2 10"
    
    var manager: LCPManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        manager = LCPManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetLowestCostPath1() {
        let result = manager.computeMinCosts(inputString: testCase1)
        XCTAssertEqual(result.result, .yes)
        XCTAssertEqual(result.cost, 16)
        XCTAssertEqual(result.path, [1, 2, 3, 4, 4,  5])
    }
    
    /*
    func testGetValidLeftValues() {
        let grid = Grid(inputString: testCase0)
        if let grid = grid {
            let result1 = manager.getValidLeftIndices(grid: grid, i: 0, j: 0)
            let result2 = manager.getValidLeftIndices(grid: grid, i: 0, j: 1)
            let result3 = manager.getValidLeftIndices(grid: grid, i: 1, j: 1)
            let result4 = manager.getValidLeftIndices(grid: grid, i: 4, j: 1)
            
            // Result 1 - All nil
            XCTAssertNil(result1.validLeft1)
            XCTAssertNil(result1.validLeft2)
            XCTAssertNil(result1.validLeft3)
            
            // Result2 - Wrapped values
            XCTAssertEqual(result2.validLeft1!, (i:0, j: 0))
            XCTAssertEqual(result2.validLeft2!, (i:4, j: 0))
            XCTAssertEqual(result2.validLeft3!, (i:1, j: 0))

            // Result3 - Normal values
            XCTAssertEqual(result3.validLeft1, (i: 1, j: 0))
            XCTAssertEqual(result3.validLeft2, (i: 0, j: 0))
            XCTAssertEqual(result3.validLeft3, (i: 2, j: 0))
            
            // Result4 - Wrapped upwards
            XCTAssertEqual(result4.validLeft1, (i: 4, j: 0))
            XCTAssertEqual(result4.validLeft2, (i: 3, j: 0))
            XCTAssertEqual(result4.validLeft3, (i: 0, j: 0))
        }
    }
    */
}
