//
//  100-SameTree.swift
//  Lee
//
//  Created by Matthew Lu on 4/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given the roots of two binary trees p and q, write a function to check if they are the same or not.
//
//Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
//
//Example 1:
//
//Input: p = [1,2,3], q = [1,2,3]
//Output: true
//Example 2:
//
//
//Input: p = [1,2], q = [1,null,2]
//Output: false
//Example 3:
//
//
//Input: p = [1,2,1], q = [1,1,2]
//Output: false

/**
 * Definition for a binary tree node.

 */
class Solution_100 {
    
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
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
       
        if p == nil && q == nil {
            return true
        } else if q == nil || p == nil {
            return false
        } else if q!.val != p!.val {
            return false
        } else {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        
    }
}
