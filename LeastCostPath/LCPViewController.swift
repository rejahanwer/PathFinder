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
        guard !(input.isEmpty ||
                input == "\n" ||
                self.hasNonNumerics(string: input)) else {
            print ("Invalid input")
            return false
        }
        
        guard (validateRowSize(input: input) && validateColumnSize(input: input)) else {
            print ("Invalid grid size")
            return false
        }
        
        return true
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
    
    // Return the columns in a row
    func getColumns(inputString: String) -> [String] {
        guard !(inputString.isEmpty) else {
            return []
        }

        let columns = inputString.components(separatedBy: " ")
        return columns
    }
    
    // Return number of rows in a matrix formatted string.
    func getRowsCount(inputString: String) -> Int {
        
        let rows = getRows(inputString: inputString)
        return rows.count
    }
    
    // Return number of columns for the first row in a matrix formatted string.
    func getColumnCount(inputString: String) -> Int {
        let rows = getRows(inputString: inputString)
        if let firstRow = rows.first {
            let columns = getColumns(inputString: firstRow)
            return columns.count
        }
        
        return 0
    }
}
