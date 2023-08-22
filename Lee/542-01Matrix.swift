//
//  542-01Matrix.swift
//  Lee
//
//  Created by Matthew Lu on 24/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
 // Time: O(MN)
// Space: O(MN)
class Solution_542 {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
            

        var distance = [[Int]](repeating: [Int](repeating: Int.max, count: mat[0].count), count: mat.count)
        var seen: [[Bool]] = Array(repeating: Array(repeating: false, count: mat[0].count), count: mat.count)
        
        var queue: [[Int]] = []
        //！先将 0 加入到 队列
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                if (mat[i][j] == 0) {
                    queue.append([i, j])
                    distance[i][j] = 0
                    seen[i][j] = true
                }
            }
        }
        
        let dirs = [[-1, 0], [0, -1],  [1, 0], [0, 1] ]
        while (!queue.isEmpty) {
            let s = queue.removeFirst()
            //! 从 0 轴 开始 扩撒
            let cur_i = s[0]
            let cur_j = s[1]
            
            for dir in dirs {
                
              let next_i = cur_i + dir[0]
              let next_j = cur_j + dir[1]
                
                
                if (next_i >= 0 && next_i < distance.count && next_j >= 0 && next_j < distance[0].count && !seen[next_i][next_j]) {
                    distance[next_i][next_j] = distance[cur_i][cur_j] + 1
                    queue.append([next_i, next_j])
                    seen[next_i][next_j] = true
                }
            }
        }
        
        return distance
        
    }
}
