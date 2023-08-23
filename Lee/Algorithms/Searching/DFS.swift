//
//  DFS.swift
//  Lee
//
//  Created by Matthew Lu on 23/8/2023.
//  Copyright © 2023 Matthew Lu. All rights reserved.
//

import Foundation

struct DFS {
    // DFS 深度搜索-从上到下
    func preorderTraversal_dfs(root: TreeNode?) -> [Int] {
        var result = [Int]()
        dfs(root, &result)
        return result
    }
    
    
    func dfs(_ root: TreeNode?, _ result: inout [Int]) {
        guard let node = root else { return }
        result.append(node.val)
        dfs(node.left, &result)
        dfs(node.right, &result)
    }
    
    
    // DFS 深度搜索-从下向上（分治法）
    
    func divideAndConquer(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        var result = [Int]()
        
        // 分治(Divide)
        let left = divideAndConquer(node.left)
        let right = divideAndConquer(node.right)
        
        // 合并结果(Conquer)
        result.append(node.val)
        result.append(contentsOf: left)
        result.append(contentsOf: right)
        return result
        
    }
    
    // DFS 深度搜索（从上到下） 和分治法区别：前者一般将最终结果通过指针参数传入，后者一般递归返回结果最后合并
    
}

struct BFS {
    // BFS 层次遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        
        var queue = [root!]
        var res = [[Int]]()
        
        while !queue.isEmpty {
            let count = queue.count // 记录当前层有多少元素（遍历当前层，再添加下一层）
            
            var level = [Int]() //存放该层所有数值
            
            for _ in 0..<count {
                let node = queue.removeFirst() // 出队列
                level.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
                
                
            }
            res.append(level)
        }
        return res
    }
}

// 分治法模板 Template

/*
 
 func traversal(_ root: TreeNode?) -> ResultType {
 
    // nil or leaf
 
    if root == nil {
      //do something and return
    }
 
    // Divide
    let left = traversal(root.left)
    let right = traversal(root.right)
 
    // conquer
    let result = Merge from left and right
 
    return result
 }
 
 
 */
