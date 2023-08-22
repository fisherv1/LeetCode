//
//  77-Combinations.swift
//  Lee
//
//  Created by Matthew Lu on 27/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].
//
//You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: n = 4, k = 2
//Output:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]
//Example 2:
//
//Input: n = 1, k = 1
//Output: [[1]]

/*
回溯+剪枝
回溯模板直接套用：
func backTracking(参数）{
    if 终止条件 {
        结果收集
    }
    剪枝
    for循环{
        添加节点
        backTracking
        删除节点，回溯
    }
}
*/


class Solution_77 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        // store result
        var retArray: [[Int]] = [[Int]]()
        
        // store backtracking result
        var retSubArray: [Int] = [Int]()
        
        // end height
        var combineDepth: Int = k
        
        // back tracking
        backTracking(n, 1, &retSubArray, &retArray, combineDepth)
        
        return retArray
    }
    
    
    func backTracking(_ n: Int, _ k: Int, _ retSubArray: inout [Int], _ retArray: inout [[Int]], _ combineDepth: Int) {
        // getting result
        
        if retSubArray.count == combineDepth {
            let array: [Int] = retSubArray
            retArray.append(array)
            return
        }
        
        
        // cut branch
        
        if n - k + 1 < combineDepth - retSubArray.count {
            return
        }
        
        for index in k...n {
            retSubArray.append(index)
            backTracking(n, index + 1, &retSubArray, &retArray, combineDepth)
            retSubArray.removeLast()
        }
        
        
    }
}
