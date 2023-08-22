//
//  144- Binary Tree Preorder Traversal.swift
//  Lee
//
//  Created by Matthew Lu on 5/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given the root of a binary tree, return the preorder traversal of its nodes' values.
//Example 1:
//
//
//Input: root = [1,null,2,3]
//Output: [1,2,3]
//Example 2:
//
//Input: root = []
//Output: []
//Example 3:
//
//Input: root = [1]
//Output: [1]
//
class Solution_144 {
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
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {

        guard let root = root else {
            return []
        }
            
        var ans: [Int] = []
        
        ans.append(root.val)
        
        ans += preorderTraversal(root.left)
        ans += preorderTraversal(root.right)
        
        return ans
    }
    
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        
        guard let root = root else {
            return  []
        }
        var ans: [Int] = []
        
        var stack: [TreeNode] = []
        
        stack.append(root)
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            ans.append(node.val)
            

            
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
        }
        
        return ans
    }
    
}
 
