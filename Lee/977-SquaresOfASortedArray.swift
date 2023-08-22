//
//  977-SquaresOfASortedArray.swift
//  Lee
//
//  Created by Matthew Lu on 18/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

//Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

//Example 1:
//nput: nums = [-4,-1,0,3,10]
//Output: [0,1,9,16,100]
//Explanation: After squaring, the array becomes [16,1,0,9,100].
//After sorting, it becomes [0,1,9,16,100].




class Solution_977 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = Array<Int>(repeating: -1, count: nums.count)
          
        
          var left = 0
          var right = nums.count - 1
          var k = nums.count - 1
          
          for _ in 0..<nums.count {
              
              if nums[left] * nums[left] < nums[right] * nums[right] {
                  result[k] = nums[right] * nums[right]
                  right -= 1
              } else {
                  result[k] = nums[left] * nums[left]
                  left += 1
              }
              k -= 1
          }
          return result
    }
}
