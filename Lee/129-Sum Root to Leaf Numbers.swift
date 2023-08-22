//
//  129-Sum Root to Leaf Numbers.swift
//  Lee
//
//  Created by Matthew Lu on 4/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given the root of a binary tree containing digits from 0 to 9 only.
//
//Each root-to-leaf path in the tree represents a number.
//
//For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
//Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a 32-bit integer.
//
//A leaf node is a node with no children.
//
//Example 1:
//
//
//Input: root = [1,2,3]
//Output: 25
//Explanation:
//The root-to-leaf path 1->2 represents the number 12.
//The root-to-leaf path 1->3 represents the number 13.
//Therefore, sum = 12 + 13 = 25.
//Example 2:
//
//
//Input: root = [4,9,0,5,1]
//Output: 1026
//Explanation:
//The root-to-leaf path 4->9->5 represents the number 495.
//The root-to-leaf path 4->9->1 represents the number 491.
//The root-to-leaf path 4->0 represents the number 40.
//Therefore, sum = 495 + 491 + 40 = 1026.
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
class Solution_129 {
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        
        return dfs(root, 0)
    }
    
    func dfs(_ root: TreeNode?, _ prevSum: Int) -> Int {
        
        guard let root = root else {
            return 0
        }

        let sum = 10 * root.val + prevSum
        
        if root.left == nil && root.right == nil {
            return sum
        } else {
            
            return dfs(root.left, sum) + dfs(root.right, sum)
        }
    }
    
    
    
}
