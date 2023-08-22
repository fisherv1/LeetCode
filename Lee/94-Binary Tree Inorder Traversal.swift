//
//  94-Binary Tree Inorder Traversal.swift
//  Lee
//
//  Created by Matthew Lu on 5/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given the root of a binary tree, return the inorder traversal of its nodes' values.
//
//Example 1:
//
//Input: root = [1,null,2,3]
//Output: [1,3,2]
//Example 2:
//
//Input: root = []
//Output: []
//Example 3:
//
//Input: root = [1]
//Output: [1]
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution_94 {
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
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
        guard let root = root else {
            return []
        }
        
        var ans: [Int] = []
        
        ans += inorderTraversal(root.left)
        ans.append(root.val)
        ans += inorderTraversal(root.right)
        return ans
    }
    
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        
        
        guard let root = root else {
            return []
        }
        
        var ans: [Int] = []
        var stack:[TreeNode] = []
        
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            
            node = stack.removeLast()
            ans.append(node!.val)
            node = node?.right
        
        }
        
        return ans
        
    }
        
    
}
