//
//  120-Triangle.swift
//  Lee
//
//  Created by Matthew Lu on 28/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a triangle array, return the minimum path sum from top to bottom.
//
//For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.
//Example 1:
//
//Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
//Output: 11
//Explanation: The triangle looks like:
//   2
//  3 4
// 6 5 7
//4 1 8 3
//The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
//Example 2:
//
//Input: triangle = [[-10]]
//Output: -10

class Solution_120 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        let n = triangle.count
        
        guard n > 0 else { return 0 }
        // dp[i][j] 表示从点 (i, j) 到底边的最小路径和。
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        
        // 从三角形的最后一行开始递推。
        
        for i in stride(from: n-1, through: 0 , by: -1) {
            for j in 0...i {
             dp[i][j] = min(dp[i + 1][j], dp[i + 1][j + 1]) + triangle[i][j]
            }
        }
        
        return dp[0][0]
    }
}
