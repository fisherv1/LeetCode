//
//  617-MergeTwoBinaryTrees.swift
//  Lee
//
//  Created by Matthew Lu on 24/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given two binary trees root1 and root2.
//
//Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.
//
//Return the merged tree.
//
//Note: The merging process must start from the root nodes of both trees.
//
//Example 1:
//Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
//Output: [3,4,5,5,4,null,7]
//
//Example 2:
//Input: root1 = [1], root2 = [1,2]
//Output: [2,2]
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
class Solution_617 {
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
    
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else {
            return root2
        }
        guard let root2 = root2 else {
            return root1
        }
        
        let newTreeNode = TreeNode(root1.val + root2.val)
        newTreeNode.left = mergeTrees(root1.left, root2.left)
        newTreeNode.right = mergeTrees(root1.right, root2.right)
        return newTreeNode
    }
}
