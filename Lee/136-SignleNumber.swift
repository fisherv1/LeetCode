//
//  136-SignleNumber.swift
//  Lee
//
//  Created by Matthew Lu on 30/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//
//You must implement a solution with a linear runtime complexity and use only constant extra space.
//
//
//
//Example 1:
//
//Input: nums = [2,2,1]
//Output: 1
//Example 2:
//
//Input: nums = [4,1,2,1,2]
//Output: 4
//Example 3:
//
//Input: nums = [1]
//Output: 1

//本质上是位运算
//
//1.任何数于0异或为任何数 0 ^ n => n
//2.相同的数异或为0: n ^ n => 0

class Solution_136 {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        
        for num in nums {
            result = result ^ num
        }
        return result
    }
}
