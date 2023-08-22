/*
 505. The Maze II
 There is a ball in a maze with empty spaces (represented as 0) and walls (represented as 1). The ball can go through the empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

 Given the m x n maze, the ball's start position and the destination, where start = [startrow, startcol] and destination = [destinationrow, destinationcol], return the shortest distance for the ball to stop at the destination. If the ball cannot stop at destination, return -1.

 The distance is the number of empty spaces traveled by the ball from the start position (excluded) to the destination (included).

 You may assume that the borders of the maze are all walls (see examples).

 Example 1:
 
 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
 Output: 12
 Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.
 The length of the path is 1 + 1 + 3 + 1 + 2 + 2 + 2 = 12.

 Example 2:
 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [3,2]
 Output: -1
 Explanation: There is no way for the ball to stop at the destination. Notice that you can pass through the destination but you cannot stop there
 
 Example 3:
 
 Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
 Output: -1

 */

class Solution_505 {

    func shortestDistance(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {

        var distance = [[Int]](repeating: [Int](repeating: Int.max, count: maze[0].count), count: maze.count)
        
        distance[start[0]][start[1]] = 0
        
        dfs(maze, start, &distance)
        
        //  bfs(maze, start, &distance)
        return distance[destination[0]][destination[1]] == Int.max ? -1 : distance[destination[0]][destination[1]]
        
    }
    
    
    
    private func dfs(_ maze: [[Int]], _ start: [Int], _ distance: inout [[Int]]) {
        let dirs = [[0, 1], [0, -1], [-1, 0], [1, 0]]
        
        for dir in dirs {
            
            var x = start[0] + dir[0]
            var y = start[1] + dir[1]
            
            var count = 0
            
            while (x >= 0 && y >= 0 && x < maze.count && y < maze[0].count && maze[x][y] == 0) {
                x += dir[0]
                y += dir[1]
                count += 1
            }
            
            if (distance[start[0]][start[1]] + count < distance[x - dir[0]][y - dir[1]]) {
                distance[x - dir[0]][y - dir[1]] = distance[start[0]][start[1]] + count
                dfs(maze, [x - dir[0], y - dir[1]], &distance)
            }
        }
    }
    
    
    private func bfs(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        var distance = [[Int]](repeating: [Int](repeating: Int.max, count: maze[0].count), count: maze.count)
        distance[start[0]][start[1]] = 0
        let dirs = [[0, 1], [0, -1], [-1, 0], [1, 0]]
        
        var queue: [[Int]] = []
        
        queue.append(start)
        
        while (!queue.isEmpty) {
            let s = queue.removeLast()
            
            for dir in dirs {
                var x = s[0] + dir[0]
                var y = s[1] + dir[1]
                var count = 0
                
                while (x >= 0 && y >= 0 && x < maze.count && y < maze[0].count && maze[x][y] == 0) {
                    x += dir[0]
                    y += dir[1]
                    count += 1
                }
                
                
                if (distance[s[0]][s[1]] + count < distance[x - dir[0]][y - dir[1]]) {
                    distance[x - dir[0]][y - dir[1]] = distance[s[0]][s[1]] + count
                    queue.append([x - dir[0], y - dir[1]])
                }
                
            }
        }
        
        return distance[destination[0]][destination[1]] == Int.max ? -1 : distance[destination[0]][destination[1]]
    }
}
