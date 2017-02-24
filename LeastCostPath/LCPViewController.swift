//
//  ViewController.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah on 2/23/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import UIKit

class LCPViewController: UIViewController {
    let minRowCount = 1
    let maxRowCount = 10
    let minColumnCount = 5
    let maxColumnCount = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Check if in valid format.
    func isValidInput(input: String) -> Bool {
        // Check if \n and spaces are correct.
        // Check if all numeric values
        //
        
        return false
    }

    func hasNonNumerics(string: String) -> Bool {
        let validCharacters: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", "\n"]
        // Check if any other character present.
        return !Set(string.characters).isSubset(of: validCharacters)
    }
    
    func isEmptyString(string: String) -> Bool {
        return string.isEmpty
    }
    
    func validateRowSize(input: String) -> Bool {
        return minRowCount...maxRowCount ~= getRowsCount(inputString: input)
    }
    
    func validateColumnSize(input: String) -> Bool {
        return minColumnCount...maxColumnCount ~= getColumnCount(inputString: input)
    }
    
    // Retreive rows count from the input string
    func getRows(inputString: String) -> [String] {
        var tempString = inputString
        
        // Return 0 for empty string.
        guard !(tempString.isEmpty || tempString == "\n") else {
            return []
        }
        
        // Handle only "\n" or strings that end with "\n"
        if inputString.characters.last == "\n" {
            tempString = inputString.substring(to: inputString.index(before: inputString.endIndex))
        }
        
        let rows = tempString.components(separatedBy: "\n")
        return rows
    }
    
    func getColumns(inputString: String) -> [String] {
        guard !(inputString.isEmpty) else {
            return []
        }

        let columns = inputString.components(separatedBy: " ")
        return columns
    }
    
    func getRowsCount(inputString: String) -> Int {
        
        let rows = getRows(inputString: inputString)
        return rows.count
    }
    
    func getColumnCount(inputString: String) -> Int {
        let rows = getRows(inputString: inputString)
        let columns = getColumns(inputString: inputString)
        return 0
    }
}
