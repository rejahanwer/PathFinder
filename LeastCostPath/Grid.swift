//
//  Matrix.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import Foundation

class MatrixFactory {
    class func getMatrix(rowCount: Int, colCount: Int) -> [[Int]] {
        let matrix = [[Int]](repeating: [Int](repeating: 0, count: colCount), count: rowCount)
        return matrix
    }

    class func getMatrix(inputString: String, rowCount: Int, colCount: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: colCount), count: rowCount)
        let rows = Utility.getRows(inputString: inputString)
        for i in 0 ..< rowCount {
            let row = rows[i]
            let column = Utility.getColumns(inputString: row)
            matrix[i] = column
        }
        
        return matrix
    }
}

struct Grid {
    let rowCount: Int
    let colCount: Int
    var matrix: [[Int]]
    
    func valueAt(i: Int, j: Int) -> Int {
        return matrix[i][j]
    }
    
    // Initialize an empty grid.
    init? (rows: Int, columns: Int) {
        rowCount = rows
        colCount = columns
        matrix = MatrixFactory.getMatrix(rowCount: rowCount, colCount: colCount)
    }
    
    // Initialize a Grid with valid input string.
    init?(inputString: String) {
        guard Utility.isValidInput(input: inputString) else {
            return nil
        }
        
        rowCount = Utility.getRowsCount(inputString: inputString)
        colCount = Utility.getColumnCount(inputString: inputString)
        matrix = MatrixFactory.getMatrix(inputString: inputString, rowCount: rowCount, colCount: colCount)
    }
    
    func validateIndex(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rowCount && column >= 0 && column < colCount
    }
    
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(validateIndex(row: row, column: column), "Index out of range")
            return matrix[row][column]
        }
        set {
            assert(validateIndex(row: row, column: column), "Index out of range")
            matrix[row][column] = newValue
        }
    }    
}
