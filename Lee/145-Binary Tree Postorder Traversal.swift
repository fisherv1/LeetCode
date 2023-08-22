//
//  145-Binary Tree Postorder Traversal.swift
//  Lee
//
//  Created by Matthew Lu on 5/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given the root of a binary tree, return the postorder traversal of its nodes' values.
//
//Example 1:
//
//Input: root = [1,null,2,3]
//Output: [3,2,1]
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
class Solution_145 {
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
    
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var ans: [Int] = []
        
        ans += postorderTraversal(root.left)
        ans += postorderTraversal(root.right)
        ans.append(root.val)
        
        return ans
    }
    
    
    
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
      
        var ans: [Int] = []
        var stack: [TreeNode] = []
        var cur = root
        var pre: TreeNode?
        
        while cur != nil && !stack.isEmpty {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            
            cur = stack.last
            
            if ( cur?.right == nil && cur!.right === pre ) {
                ans.append(stack.removeLast().val)
                pre = cur
                cur = nil
            } else {
                cur = cur?.right
            }
        
        }
        
        return ans
        
    }
    
    
    
    
}
