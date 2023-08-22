//
//  199-BinaryTreeRightSideView.swift
//  Lee
//
//  Created by Matthew Lu on 30/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//
//Example 1:
//
//Input: root = [1,2,3,null,5,null,4]
//Output: [1,3,4]
//Example 2:
//
//Input: root = [1,null,3]
//Output: [1,3]
//Example 3:
//
//Input: root = []
//Output: []

class Solution_199 {
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
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var result: [Int] = []
        var depth = 0
        dfs(root: root, depth: &depth, result: &result)
        return result
    }
    
    func dfs(root: TreeNode?, depth: inout Int, result: inout [Int]) {
        guard let root = root else {
            return
        }
        if depth == result.count {
            result.append(root.val)
        }
        
        depth += 1
        dfs(root: root.right, depth: &depth, result: &result)
        dfs(root: root.left, depth: &depth, result: &result)
    }
}
