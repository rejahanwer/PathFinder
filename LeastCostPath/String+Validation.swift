//
//  String+Validation.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah (Contractor) on 2/24/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import Foundation

extension String {
    // Checks if the given string has any character other than the valid ones.
    var hasNonNumerics: Bool {
        let validCharacters: Set<Character> = ["-", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", "\n"]
        return !Set(self.characters).isSubset(of: validCharacters)
    }
}
