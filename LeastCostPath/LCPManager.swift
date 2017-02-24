//
//  LCPManager.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah (Contractor) on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import Foundation

typealias LCPBool = (result: Bool, cost: Int, path: [Int])
typealias LCPResult = (result: ResultString, cost: Int, path: [Int])
typealias GridItem = (i: Int, j: Int, value: Int)

class LCPManager {
    
    var tempGrid: Grid! = nil
    
    func getLowestCostPath(inputString: String) -> LCPResult {
        // Get grid from input string.
        if let grid = Grid(inputString: inputString) {
        
            // Get LCP for grid.
            let result = getLowestCostPath(grid: grid)
        }
        
        return (.no, 0, [])
    }
    
    // Computes minimum cost path for each item and updates in a temp Grid.
    private func computeMinCosts(grid: Grid) {
        // Temporary grid of same size
        tempGrid = Grid(rows: grid.rowCount, columns: grid.colCount)
        if var tempGrid = tempGrid {
            // Iterate through every Column, row wise.
            for j in 0 ..< grid.colCount {
                for i in 0 ..< grid.rowCount {
                    // Update first column with same values as the grid.
                    if j == 0 {
                        tempGrid[i, j] = grid[i, j]
                    }
                    else
                    {
                        // Update temp grid with minCostPaths to reach each element.
                        let validLeftIndices = getValidLeftItems(grid: tempGrid, i: i, j: j)
                        if let minValue = minimumCost(items: validLeftIndices)?.value {
                            tempGrid[i, j] = grid[i, j] + minValue
                        }
                    }
                }
            }
            
            print ("grid: ", grid)
            print ("tempGrid: ", tempGrid)
        }
    }
    
    // Get minimum grid Item from amongst 3.
    private func minimumCost(items: [GridItem]) -> GridItem? {
        
        // Handle 0 or 1 items.
        guard items.count > 0 else { return nil }
        guard items.count > 1 else { return items.first }
        let minElement = items.map{$0.value}.min()
        let minArray = items.filter {$0.value == minElement}
        let minItem = minArray.first
        return minItem
    }
        
    // Function to get the valid previous rows.
    func getValidLeftItems(grid: Grid, i: Int, j: Int) -> [GridItem] //(validLeft1: GridItem?,
                                                                     //validLeft2: GridItem?,
                                                                     // validLeft3: GridItem?)
    {
        // Invalid rowCounts or First column
        guard grid.rowCount > 0 && grid.colCount > 0 && j > 0 else {
            return []
        }
        
        let lastRow = grid.rowCount - 1
        
        // Same row, previous column.
        let validLeft1 = (i, j-1, grid[i, j-1])
        var resultItem = [validLeft1]
        var validLeft2: GridItem
        var validLeft3: GridItem

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
}
