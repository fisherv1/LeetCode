//
//  46-Permutations.swift
//  Lee
//
//  Created by Matthew Lu on 27/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
//
//Example 1:
//
//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//Example 2:
//
//Input: nums = [0,1]
//Output: [[0,1],[1,0]]
//Example 3:
//
//Input: nums = [1]
//Output: [[1]]

class Solution_46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var output: [Int] = nums
        
        dps(output: &output, count: nums.count, first: 0, res: &res)
        return res
    }
    
    func dps(output: inout [Int], count: Int, first: Int, res: inout [[Int]]) {
        if first == count {
            res.append(output)
        }
        
        for i in first..<count {
            output.swapAt(i, first)
            dps(output: &output, count: count, first: first + 1, res: &res)
            output.swapAt(i, first)
        }
    }
}
