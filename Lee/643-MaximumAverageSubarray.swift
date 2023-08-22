//
//  643-MaximumAverageSubarray.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given an integer array nums consisting of n elements, and an integer k.
//
//Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.
//
//
//
//Example 1:
//
//Input: nums = [1,12,-5,-6,50,3], k = 4
//Output: 12.75000
//Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
//Example 2:
//
//Input: nums = [5], k = 1
//Output: 5.00000

class Solution_643 {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {

        var maxSum: Int = 0
        // get first k element sum
        for i in 0..<k {
            print("gg i ", i)
            maxSum += nums[i]
        }
        print("gg sum ", maxSum)
        
        var result = maxSum
        
        for i in k..<nums.count {
            
            maxSum = maxSum + nums[i] - nums[i - k] // slide right 1 steps , add right element , remove first element
            
            print("gg", maxSum, "-", nums[i], "-", nums[i-k])
            
            result = max(result, maxSum) // store the max sum
        }
        print("gg maxSum", maxSum)
        
        return Double(maxSum) / Double(k)
    }
}
