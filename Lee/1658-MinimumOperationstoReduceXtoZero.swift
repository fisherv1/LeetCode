//
//  1658-MinimumOperationstoReduceXtoZero.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.
//
//Return the minimum number of operations to reduce x to exactly 0 if it is possible, otherwise, return -1.
//
//Example 1:
//
//Input: nums = [1,1,4,2,3], x = 5
//Output: 2
//Explanation: The optimal solution is to remove the last two elements to reduce x to zero.
//Example 2:
//
//Input: nums = [5,6,7,8,9], x = 4
//Output: -1
//Example 3:
//
//Input: nums = [3,2,20,1,1,3], x = 10
//Output: 5
//Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.

class Solution_1658 {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let t = nums.reduce(0, +) - x
         var a = 0, b = 0, s = 0, m = -1
         while b < nums.count {
             s += nums[b]
             b += 1
             while s > t && a < b {
                 s -= nums[a]
                 a += 1
             }
             if s == t {
                 m = max(m, b - a)
             }
         }
         return m == -1 ? -1 : nums.count - m
    }
}
