//
//  268-MissingNumber.swift
//  Lee
//
//  Created by Matthew Lu on 28/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
class Solution_268 {
    func missingNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var i = 0
        
        while i < nums.count {
            if i != nums[i] {
                return i
            }
            i += 1
        }
        return i
    }
    
    
}
