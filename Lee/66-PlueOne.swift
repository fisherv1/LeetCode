//
//  66-PlueOne.swift
//  Lee
//
//  Created by Matthew Lu on 14/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

class Solution_66 {
    
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var ansDigits = digits
        for i in stride(from: (ansDigits.count - 1), through: 0, by: -1) {
            
            if (ansDigits[i] != 9) {
                ansDigits[i] += 1
                
                for j in (i + 1)..<ansDigits.count {
                    ansDigits[j] = 0
                }
                return ansDigits
            }
        }
    
        var newArray = [Int](repeating: 0, count: digits.count + 1)
        newArray[0] = 1
        return ansDigits
    }
    
}
