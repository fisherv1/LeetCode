//
//  111-Minimum Depth of Binary Tree.swift
//  Lee
//
//  Created by Matthew Lu on 4/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
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
class Solution_111 {
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
    
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if (root?.left == nil && root?.right == nil) {
            return 1
        }
        
        var ans = Int.max
        
        if (root?.left != nil) {
            ans = min(minDepth(root?.left), ans)
        }
        
        if (root?.right != nil) {
            ans = min(minDepth(root?.right), ans)
        }
        
        return ans + 1
    }
}
