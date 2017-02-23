//
//  ViewController.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah on 2/23/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import UIKit

class LCPViewController: UIViewController {
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
        return false
    }
    
    func validateColumnSize(input: String) -> Bool {
        return false
    }
}
