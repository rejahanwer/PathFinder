//
//  LCPManager.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah (Contractor) on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import Foundation

typealias LCPResult = (result: ResultString, cost: Int, path: [Int])
typealias GridItem = (i: Int, j: Int, value: Int)

class LCPManager {
    
    // var tempGrid: Grid! = nil
    
    func getLowestCostPath(inputString: String) -> LCPResult {
        var result: LCPResult = (.no, 0, [])
        // Get grid from input string.
        if let grid = Grid(inputString: inputString) {
            
            // Get costGrid for the grid.
            if let costGrid = computeMinCosts(grid: grid) {
                // Get the lowest cost path from the cost grid.
                result = getPath(costGrid: costGrid)
            }
        }
        else {
            // Grid not set if input is invalid.
            result.result = .invalid
        }
        
        return result
    }
    
    // Computes minimum cost path for each item and updates in a temp Grid.
    private func computeMinCosts(grid: Grid) -> Grid? {
        // Temporary grid of same size
        var costGrid = Grid(rows: grid.rowCount, columns: grid.colCount)
        
        if costGrid != nil {
            // Iterate through every Column, row wise.
            for j in 0 ..< grid.colCount {
                for i in 0 ..< grid.rowCount {
                    // Update first column with same values as the grid.
                    if j == 0 {
                        costGrid![i, j] = grid[i, j]
                    }
                    else
                    {
                        // Update temp grid with minCostPaths to reach each element.
                        // let validLeftIndices = getValidLeftItems(grid: tempGrid, i: i, j: j)
                        if let minValue = getMinimumCostLeftItem(grid: costGrid!, i: i, j: j)?.value {
                            costGrid![i, j] = grid[i, j] + minValue
                        }
                    }
                }
            }
            
            print ("grid: ", grid)
            print ("costGrid: ", costGrid!)
        }
        
        return costGrid
    }
    
    // Function to get a valid or invalid path from a costGrid.
    func getPath(costGrid: Grid) -> LCPResult {
        var cost: Int? = nil
        var pathArray = [Int]()
        var result: LCPResult = (.no, 0, [])
        
        // Get the minCost item from last column of costGrid.
        let lastColumn = costGrid.getLastColumn()
        let minItem = lastColumn.min()
        if let minItem = minItem,
            let rowNo = lastColumn.index(of: minItem) {
            if minItem <= 50 {
                // Valid path exists -> Recursively backtrack to get the min cost path.
                print ("Row no: ", rowNo)
                let path = recursiveBacktrack(grid: costGrid, i: rowNo, j: costGrid.lastColIndex, path: &pathArray)
                result = (.yes, minItem, path)
            }
            else {
                // Valid path does nt exist -> Recursively backtrack to get the point of failure.
                let failResult = recursiveBacktrackForFail(grid: costGrid, i: rowNo, j: costGrid.lastColIndex, cost: &cost, path: &pathArray)
                
                // Return cost if not nil, else 0.
                result = (.no, failResult.cost ?? 0, failResult.path)
            }
        }
        
        return result
    }
    
    // Recursively backtracks the costGrid for a valid path.
    func recursiveBacktrack(grid: Grid, i: Int, j: Int, path: inout [Int]) -> [Int] {
        // Insert visited item into the path.
        path.insert(i+1, at: 0)
        
        // Exit condition from recursive function
        // For first column, return the path array.
        if j == 0 {
            print ("Returning path: ", path)
            return path
        }

        // Recursively backtrack the min cost path.
        if let minCostleftItem = getMinimumCostLeftItem(grid: grid, i: i, j: j) {
            print ("Rentering recursion")
            path = recursiveBacktrack(grid: grid, i: minCostleftItem.i, j: minCostleftItem.j, path: &path)
        }
        
        print ("Returning path: ", path)
        return path
    }
    
    // Recursively backtracks the costGrid for a failed path.
    func recursiveBacktrackForFail(grid: Grid, i: Int, j: Int, cost: inout Int?, path: inout [Int]) -> (cost: Int?, path: [Int]) {
        var result:(cost: Int?, path: [Int]) = (cost: nil, path: [])
        // Check if minCost is less than 50, set cost if yes.
        if grid[i, j] < 50 {
            // If cost is not set yet
            if cost == nil {
                cost = grid[i, j]
            }
            // Insert the row index into path.
            path.insert(i+1, at: 0)
        }
    
        // If reached first column, return result.
        if (j == 0) {
            return (cost: cost, path: path)
        }
        
        // Backtrack.
        if let minCostLeftItem = getMinimumCostLeftItem(grid: grid, i: i, j: j) {
            result = recursiveBacktrackForFail(grid: grid, i: minCostLeftItem.i, j: minCostLeftItem.j, cost: &cost, path: &path)
        }
        
        return result
    }

    // For an item at i, j, function returns the minimum of all valid path items at left.
    func getMinimumCostLeftItem(grid: Grid, i: Int, j: Int) -> GridItem? {
        let validLeftIndices = getValidLeftItems(grid: grid, i: i, j: j)
        let minCostItem = minimumCost(items: validLeftIndices)
        return minCostItem
    }

    // Function to get the valid path items in the previous column.
    // Returns 3 valid left items.
    func getValidLeftItems(grid: Grid, i: Int, j: Int) -> [GridItem]
    {
        // Invalid rowCounts or First column
        guard grid.rowCount > 0 && grid.colCount > 0 && j > 0 else {
            return []
        }
        
        // Same row, previous column.
        let validLeft1 = (i, j-1, grid[i, j-1])
        var resultItem = [validLeft1]
        var validLeft2: GridItem
        var validLeft3: GridItem
        let lastRow = grid.lastRowIndex

        // Single row
        guard grid.rowCount > 1 else {
            return resultItem
        }
        
        // Only 2 rows
        guard grid.rowCount > 2 else {
            if (i == 0) {
                validLeft2 = (lastRow, j-1, grid[lastRow, j-1])
            }
            else {
                validLeft2 = (0, j-1, grid[0, j-1])
            }
            resultItem.append(validLeft2)
            return resultItem
        }
        
        // ValidLeft2 - Previous row, Previous column.
        // Or wrapped.
        if (i == 0) {
            validLeft2 = (lastRow, j-1, grid[lastRow, j-1])
        }
        else {
            validLeft2 = (i-1, j-1, grid[i-1, j-1])
        }
        resultItem.append(validLeft2)

        // ValidLeft3 - Next row, Previous column.
        // Or wrapped.
        if (i == lastRow) {
            validLeft3 = (0, j-1, grid[0, j-1])
        }
        else {
            validLeft3 = (i+1, j-1, grid[i+1, j-1])
        }
        resultItem.append(validLeft3)
        
        return resultItem
    }
    
    // Get minimum grid Item from an array.
    func minimumCost(items: [GridItem]) -> GridItem? {
        
        // Handle 0 or 1 items.
        guard items.count > 0 else { return nil }
        guard items.count > 1 else { return items.first }
        let minElement = items.map{$0.value}.min()
        let minItem = items.filter {$0.value == minElement}.first
        return minItem
    }
}
