//
//  209-MinimumSizeSubarraySum.swift
//  Lee
//
//  Created by Matthew Lu on 17/6/2022.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.
//
//Example 1:
//
//Input: target = 7, nums = [2,3,1,2,4,3]
//Output: 2
//Explanation: The subarray [4,3] has the minimal length under the problem constraint.
//Example 2:
//
//Input: target = 4, nums = [1,4,4]
//Output: 1
//Example 3:
//
//Input: target = 11, nums = [1,1,1,1,1,1,1,1]
//Output: 0

class Solution_209 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var start = 0
        var end = 0
        var minLen = Int.max
        var sum = 0
        
        while end < nums.count {
            sum += nums[end]
            
            while sum >= target {
                minLen = min(minLen, end - start + 1)
                sum -= nums[start]
                start += 1
            }
            end += 1
        }
        return minLen == Int.max ? 0 : minLen
    }
}
