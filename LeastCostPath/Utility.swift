//
//  Utility.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah (Contractor) on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import Foundation

let minRowCount = 1
let maxRowCount = 10
let minColumnCount = 5
let maxColumnCount = 100
let emptyString = ""
let inputString1 = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5"
let inputString2 = "1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n1 2 3 4 5\n"
let inputString3 = "\n"

enum ResultString: String {
    case yes = "Yes"
    case no = "No"
    case invalid = "Invalid"
}

class Utility {
    // Check if in valid format.
    class func isValidInput(input: String) -> Bool {
        guard !(input.isEmpty ||
            input == "\n" ||
            input.hasNonNumerics) else {
                print ("Invalid input")
                return false
        }
        
        guard (validateRowSize(input: input) && validateColumnSize(input: input)) else {
            print ("Invalid grid size")
            return false
        }
        
        return true
    }
    
    class func validateRowSize(input: String) -> Bool {
        return minRowCount...maxRowCount ~= getRowsCount(inputString: input)
    }
    
    class func validateColumnSize(input: String) -> Bool {
        return minColumnCount...maxColumnCount ~= getColumnCount(inputString: input)
    }
    
    // Return number of rows in a matrix formatted string.
    class func getRowsCount(inputString: String) -> Int {
        
        let rows = getRows(inputString: inputString)
        return rows.count
    }
    
    // Return number of columns for the first row in a matrix formatted string.
    class func getColumnCount(inputString: String) -> Int {
        let rows = getRows(inputString: inputString)
        if let firstRow = rows.first {
            let columns = getColumns(inputString: firstRow)
            return columns.count
        }
        
        return 0
    }
    
    // Retreive rows count from the input string
    class func getRows(inputString: String) -> [String] {
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
    class func getColumns(inputString: String) -> [Int] {
        guard !(inputString.isEmpty) else {
            return []
        }
        
        var columns = inputString.components(separatedBy: " ")
        
        // Remove empty spaces if any entered in error.
        columns = columns.filter {$0 != "" && $0 != " "}
        
        // Convert to Ints.
        let columnsInt = columns.map { Int($0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!}
        return columnsInt
    }
}
