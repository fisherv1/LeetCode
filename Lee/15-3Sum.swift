//
//  15-3Sum.swift
//  Lee
//
//  Created by Matthew Lu on 2/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
//Notice that the solution set must not contain duplicate triplets.
//
//Example 1:
//
//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]
//Example 2:
//
//Input: nums = []
//Output: []
//Example 3:
//
//Input: nums = [0]
//Output: []

class Solution_15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        // 找出a + b + c = 0
        // a = nums[i], b = nums[left], c = nums[right]
        
        let sorted = nums.sorted()
        
        for i in 0..<sorted.count {
            // 排序之后如果第一个元素已经大于零，那么无论如何组合都不可能凑成三元组，直接返回结果就可以了
            if sorted[i] > 0 {
                return res
            }
            
            // 错误去重方法，将会漏掉-1,-1,2 这种情况
            /*
             if (nums[i] == nums[i + 1]) {
             continue;
             } */
                     
            // 正确去重方法
            if i > 0 && sorted[i] == sorted[i - 1] {
                continue
            }
            
            var left = i + 1
            var right = sorted.count - 1
            
            while left < right {
                
                // 去重复逻辑如果放在这里，0，0，0 的情况，可能直接导致 right<=left 了，从而漏掉了 0,0,0 这种三元组
                /*
                 while (right > left && nums[right] == nums[right - 1]) right--;
                 while (right > left && nums[left] == nums[left + 1]) left++;
                 */
                
                let sum = sorted[i] + sorted[left] + sorted[right]
                
                if sum < 0 {
                    left += 1
                    
                } else if sum > 0 {
                    right -= 1
                } else {
                    
                    res.append([sorted[i], sorted[left], sorted[right]])
                    // 去重逻辑应该放在找到一个三元组之后
                    while left < right && sorted[left] == sorted[left + 1] {
                        left += 1
                    }
                    
                    while left < right && sorted[right] == sorted[right - 1] {
                        right -= 1
                    }
                    // 找到答案时，双指针同时收缩
                    left += 1
                    right -= 1
                }

            }
        }
        
        return res
        
        
    }
}
