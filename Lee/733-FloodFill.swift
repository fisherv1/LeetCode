//
//  733-FloodFill.swift
//  Lee
//
//  Created by Matthew Lu on 23/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

//An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
//
//You are also given three integers sr, sc, and newColor. You should perform a flood fill on the image starting from the pixel image[sr][sc].
//
//To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with newColor.
//
//Return the modified image after performing the flood fill.


//Example 1:
//
//Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
//Output: [[2,2,2],[2,2,0],[2,0,1]]
//Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
//Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.

//Example 2:
//Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, newColor = 2
//Output: [[2,2,2],[2,2,2]]
//


class Solution_733 {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var imageCopy = image
        let oldColor = image[sr][sc]
        imageCopy[sr][sc] = newColor
        
        
        dfs(sr, sc, newColor,  oldColor, &imageCopy)
        
        return imageCopy
    }
    
    func dfs(_ sr: Int, _ sc: Int, _ newColor: Int, _ oldColor: Int ,  _ image: inout [[Int]]) {
        
        var queue = [[Int]]()
        var visited = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
        
        queue.append([sr, sc])
        let dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
        
        while !queue.isEmpty {
            guard let q = queue.popLast() else {
                return
            }
            let newPositionColor = image[q[0]][q[1]]
            if newPositionColor == oldColor {
                image[q[0]][q[1]] = newColor
                visited[q[0]][q[1]] = true
            }
            
            for dir in dirs {
             
                let x = q[0] + dir[0]
                let y = q[1] + dir[1]
                
                if x >= 0 && x < image.count && y >= 0 && y < image[0].count && image[x][y] == oldColor && image[x][y] != newColor &&  visited[x][y] == false {
                    queue.append([x, y])
                }
            }
        }
    }
}

