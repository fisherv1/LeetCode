/*
 Problem:
 There is a ball in a maze with empty spaces (represented as 0) and walls (represented as 1). The ball can go through the empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

 Given the m x n maze, the ball's start position and the destination, where start = [startrow, startcol] and destination = [destinationrow, destinationcol], return true if the ball can stop at the destination, otherwise return false.

 You may assume that the borders of the maze are all walls (see examples).


 The maze is represented by a binary 2D array. 1 means the wall and 0 means the empty space. You may assume that the borders of the maze are all walls. The start and destination coordinates are represented by row and column indexes.
 Example 1
 
 Input 1: a maze represented by a 2D array

 0 0 1 0 0
 0 0 0 0 0
 0 0 0 1 0
 1 1 0 1 1
 0 0 0 0 0

 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
 Output: true
 Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.

 
 Example 2
 Input 1: a maze represented by a 2D array

 0 0 1 0 0
 0 0 0 0 0
 0 0 0 1 0
 1 1 0 1 1
 0 0 0 0 0

 Input 2: start coordinate (rowStart, colStart) = (0, 4)
 Input 3: destination coordinate (rowDest, colDest) = (3, 2)

 Output: false
 Explanation: There is no way for the ball to stop at the destination.
 
 Example 3
 Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
 Output: false

 */
import Foundation


class Solution_490 {
    
    func hasPath(maze: [[Int]], start: [Int], destination: [Int]) -> Bool {
//        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maze[0].count), count: maze.count)
//
//        return dfs(maze: maze, start: start, destination: destination, visited: &visited)
        
        
        return bfs(maze: maze, start: start, destination: destination)
    }
    
    
    func dfs(maze: [[Int]], start: [Int], destination:[Int],  visited: inout [[Bool]]) -> Bool {// Time: O(MN), Space: O(MN)
    
        if visited[start[0]][start[1]] {
            return false
        }
        
        if start[0] == destination[0] && start[1] == destination[1] {
            return true
        }
        
        visited[start[0]][start[1]] = true
        
        var r = start[1] + 1, l = start[1] - 1, u = start[0] - 1, d = start[0] + 1
        
        while r < maze[0].count && maze[start[0]][r] == 0 {
            r += 1
        }
        
        if dfs(maze: maze, start: [start[0], r - 1], destination: destination, visited: &visited) {
            return true
        }
        
        
        while l >= 0 && maze[start[0]][l] == 0 {
            l -= 1
        }
        
        if dfs(maze: maze, start: [start[0], l + 1], destination: destination, visited: &visited) {
            return true
        }
        
        while u >= 0 && maze[u][start[1]] == 0 {
            u -= 1
        }
        
        if dfs(maze: maze, start: [u + 1, start[1]], destination: destination, visited: &visited) {
            return true
        }
 
        
        while d < maze.count && maze[d][start[1]] == 0 {
            d += 1
        }
        
        if dfs(maze: maze, start: [d - 1, start[1]], destination: destination, visited: &visited) {
            return true
        }
        
        return false
    }
    
    
    
    
    func bfs(maze: [[Int]], start: [Int], destination:[Int]) -> Bool { // Time: O(MN), Space: O(MN)
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maze[0].count), count: maze.count)
        
        let dirs = [[0,1], [0,-1], [-1,0], [1,0]]
        
        var queue: [[Int]] = []
        
        
        queue.append(start)
        
        visited[start[0]][start[1]] = true
        
        while !queue.isEmpty {
            
            let s = queue.removeLast()
            
            if s[0] == destination[0] && s[1] == destination[1] {
                return true
            }
            
            for dir in dirs {
                
                var x = s[0] + dir[0]
                var y = s[1] + dir[1]
                
                while x >= 0 && y >= 0 && x < maze.count && y < maze[0].count && maze[x][y] == 0 {
                    x += dir[0]
                    y += dir[1]
                }
                
                if !visited[x - dir[0]][y - dir[1]] {
                    queue.append([x - dir[0], y - dir[1]])
                    visited[x - dir[0]][y - dir[1]] = true
                }
            }
        }
        return false
    }

}
