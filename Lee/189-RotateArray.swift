//
//  189-RotateArray.swift
//  Lee
//
//  Created by Matthew Lu on 18/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

/* Given an array, rotate the array to the right by k steps, where k is non-negative.

Example 1:
Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]

Example 2:
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 */

import Foundation
class Solution_189 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k1 = k % nums.count
        
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k1 - 1)
        reverse(&nums, k1, nums.count - 1)
    }
    
    
    
    func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        
        var start = left
        var end = right
        
        while start < end {
            
            let temp = nums[start]
            
            nums[start] = nums[end]
            nums[end] = temp
            
            start += 1
            end -= 1
        }
        
    }
}
