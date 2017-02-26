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
    let testCase9 = "60 3 3 6 4\n6 3 7 9 3\n5 6 8 3 2"
    let testCase10_negativeValues = " 6 3 -5 9 4\n-5 2 4 10 3\n3 -2 6 10 2\n6 -1 -2 10 1"
    
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
    
    // Test for minimumCost function in LCPManager.
    func testMinimumCost() {
        let item1: GridItem = (i:0, j:0, value: 10)
        let item2: GridItem = (i:1, j:0, value: 20)
        let item3: GridItem = (i:2, j:0, value: 5)
        let items = [item1, item2, item3]
        let minItem = manager.minimumCost(items: items)
        
        XCTAssertNotNil(minItem)
    }
    
    func testGetPath_ValidPath1() {
        let result = manager.getLowestCostPath(inputString: testCase1)
        XCTAssertEqual(result.result, .yes)
        XCTAssertEqual(result.cost, 16)
        XCTAssertEqual(result.path, [1, 2, 3, 4, 4, 5])
    }
    
    func testGetPath_ValidPath2() {
        let result = manager.getLowestCostPath(inputString: testCase2)
        XCTAssertEqual(result.result, .yes)
        XCTAssertEqual(result.cost, 11)
        
        // 2 Valid answers
        let resultBool = (result.path == [1, 2, 1, 5, 4, 5] || result.path == [1, 2, 1, 5, 5, 5])
        XCTAssertTrue(resultBool)
    }

    func testGetPath_NoPath() {
        let result = manager.getLowestCostPath(inputString: testCase3_noPath)
        XCTAssertEqual(result.result, .no)
        XCTAssertEqual(result.cost, 48)
        XCTAssertEqual(result.path, [1, 1, 1])
    }
    
    func testGetPath_1by5() {
        let result = manager.getLowestCostPath(inputString: testCase4_1by5)
        XCTAssertEqual(result.result, .yes)
        XCTAssertEqual(result.cost, 26)
        XCTAssertEqual(result.path, [1, 1, 1, 1, 1])
    }
    
    // Invalid input.
    func testGetPath_5by1() {
        let result = manager.getLowestCostPath(inputString: testCase5_5by1)
        XCTAssertEqual(result.result, .invalid)
    }

    func testGetPath_NonNumeric() {
        let result = manager.getLowestCostPath(inputString: testCase6_nonNumeric)
        XCTAssertEqual(result.result, .invalid)
    }
    
    func testGetPath_NoInput() {
        let result = manager.getLowestCostPath(inputString: testCase7_noInput)
        XCTAssertEqual(result.result, .invalid)
    }
    
    func testGetPath_Greater50() {
        let result = manager.getLowestCostPath(inputString: testCase8)
        XCTAssertEqual(result.result, .no)
        XCTAssertEqual(result.cost, 0)
        XCTAssertEqual(result.path, [])
    }
    
    func testGetPath9() {
        let result = manager.getLowestCostPath(inputString: testCase9)
        XCTAssertEqual(result.result, .yes)
        XCTAssertEqual(result.cost, 16)
        // 2 Valid paths
        let resultBool = (result.path == [3, 1, 1, 3, 3] || result.path == [3, 2, 1, 3, 3])
        XCTAssertTrue(resultBool)
    }
    
    func testGetPath_NegativeValues() {
        let result = manager.getLowestCostPath(inputString: testCase10_negativeValues)
        XCTAssertEqual(result.result, .yes)
        XCTAssertEqual(result.cost, 1)
        XCTAssertEqual(result.path, [2, 3, 4, 1, 4])
    }
}
