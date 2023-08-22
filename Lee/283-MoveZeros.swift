//
//  283-MoveZeros.swift
//  Lee
//
//  Created by Matthew Lu on 19/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

//Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Note that you must do this in-place without making a copy of the array.

//Example 1:
//Input: nums = [0,1,0,3,12]
//Output: [1,3,12,0,0]


//Example 2:
//Input: nums = [0]
//Output: [0]

class Solution_283 {
    func moveZeroes(_ nums: inout [Int]) {
        var slow = 0
        var fast = 0
        
        while fast < nums.count {
            if (nums[fast] != 0) {
                nums.swapAt(slow, fast)
                slow += 1
            }
            fast += 1
        }
    }
}
