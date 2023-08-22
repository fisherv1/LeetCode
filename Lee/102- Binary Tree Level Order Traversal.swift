//
//  102- Binary Tree Level Order Traversal.swift
//  Lee
//
//  Created by Matthew Lu on 5/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
//
//
//Example 1:
//
//Input: root = [3,9,20,null,null,15,7]
//Output: [[3],[9,20],[15,7]]
//Example 2:
//
//Input: root = [1]
//Output: [[1]]
//Example 3:
//
//Input: root = []
//Output: []
class Solution_102 {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard let root = root else {
            return [[]]
        }
        
        var queue:[TreeNode] = []
        queue.append(root)
        
        var result: [[Int]] = [[]]
        
        while !queue.isEmpty {
            var levelResult: [Int] = []
            
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                levelResult.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            result.append(levelResult)
        }
        
        return result
        
    }
}
