//
//  994-RottingOranges.swift
//  Lee
//
//  Created by Matthew Lu on 25/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

//You are given an m x n grid where each cell can have one of three values:
//
//0 representing an empty cell,
//1 representing a fresh orange, or
//2 representing a rotten orange.
//Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
//
//Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
//
//Example 1:
//Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
//Output: 4
//
//Example 2:
//Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
//Output: -1
//Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
//
//Example 3:
//Input: grid = [[0,2]]
//Output: 0
//Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.

import Foundation
class Solution_994 {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return -1
        }
        // Row
        let m = grid.count
        // Column
        let n = grid[0].count
        
        // 新鲜水果数
        var fresh = 0
        
        var queue = [[Int]]()
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 2 {
                    queue.append([i,j])
                } else if grid[i][j] == 1 {
                    fresh += 1
                }
            }
        }
        
        if fresh == 0 {
            return 0
        }
        
        var oranges = grid
        
        let dirs = [[1 ,0], [-1, 0], [0, 1], [0, -1]]
        
        var minites = 0
        
        
        while !queue.isEmpty && fresh > 0 {
            var size = queue.count
            while size > 0 {
                let x = queue[0][0]
                let y = queue[0][1]
                queue.removeFirst()
                
                for i in 0..<4 {
                    let dx = x + dirs[i][0]
                    let dy = y + dirs[i][1]
                    
                    
                    if dx < 0 || dx >= m || dy < 0 || dy >= n || oranges[dx][dy] != 1 {
                        continue
                    }
                    oranges[dx][dy] = 2
                    fresh -= 1
                    queue.append([dx, dy])
                }
                
                size -= 1
            }
            minites += 1
        }
        return fresh > 0 ? -1 : minites
    }
}
