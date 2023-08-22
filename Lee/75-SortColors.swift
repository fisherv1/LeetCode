//
//  75-SortColors.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
//
//We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
//
//You must solve this problem without using the library's sort function.
//
//
//Example 1:
//
//Input: nums = [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]
//Example 2:
//
//Input: nums = [2,0,1]
//Output: [0,1,2]

class Solution_75 {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        // all number in [0, zero) = 0
        // all number in [zero, i) = 1
        // all number in [two, len - 1] = 2
        // 循环终止条件是 i == two，那么循环可以继续的条件是 i < two
        // 为了保证初始化的时候 [0, zero) 为空，设置 zero = 0，
        // 所以下面遍历到 0 的时候，先交换，再加

        var zero = 0
        
        // 为了保证初始化的时候 [two, len - 1] 为空，设置 two = len
        // 所以下面遍历到 2 的时候，先减，再交换
        var two = nums.count
        var i = 0
        
        while i<two {
            if nums[i] == 0 {
                nums.swapAt(zero, i)
                zero += 1
                i += 1
            } else if nums[i] == 1 {
                i += 1
            } else {
                two -= 1
                nums.swapAt(two, i)
            }
        }
    }
}
