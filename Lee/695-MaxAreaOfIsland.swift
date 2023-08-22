//
//  695-MaxAreaOfIsland.swift
//  Lee
//
//  Created by Matthew Lu on 23/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
//
//The area of an island is the number of cells with a value 1 in the island.
//
//Return the maximum area of an island in grid. If there is no island, return 0.
//
//
//Example 2:
//Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
//Output: 6
//Explanation: The answer is not 11, because the island must be connected 4-directionally.
//Example 2:
//
//Input: grid = [[0,0,0,0,0,0,0,0]]
//Output: 0

var areaCount = 0
var maxArea = 0
class Solution_695 {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {

        var grid = grid
        for i in 0..<grid.count {
            for j in 0..<grid.first!.count {
                if grid[i][j] == 1 {
                    IslandDFS(&grid,i,j)
                    maxArea = max(maxArea,areaCount)
                    areaCount = 0
                }
            }
        }
        
        return maxArea
    }
    
    func IslandDFS(_ grid:inout [[Int]],_ row:Int,_ col:Int) {
      
        guard row < grid.count && row >= 0 && col < grid.first!.count && col >= 0 else {
               return
           }
           
           guard grid[row][col] != 0 else {
               return
           }
           
           areaCount += 1
           
           grid[row][col] = 0
           
           IslandDFS(&grid, row, col-1)
           IslandDFS(&grid, row-1, col)
           IslandDFS(&grid, row, col+1)
           IslandDFS(&grid, row+1, col)
        
    }
}
