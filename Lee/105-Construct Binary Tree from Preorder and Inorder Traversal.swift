//
//  105-Construct Binary Tree from Preorder and Inorder Traversal.swift
//  Lee
//
//  Created by Matthew Lu on 30/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.
//
//
//
//Example 1:
//
//
//Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//Output: [3,9,20,null,null,15,7]
//Example 2:
//
//Input: preorder = [-1], inorder = [-1]
//Output: [-1]
class Solution_105 {
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
    
    
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 , inorder.count > 0 else { return nil }
        let root = TreeNode(preorder[0])
        guard let index = inorder.firstIndex(of: preorder[0]) else {return nil}
        root.left = buildTree([Int](preorder[1..<index+1]), [Int](inorder[0..<index]))
        root.right = buildTree([Int](preorder[index+1..<preorder.count]), [Int](inorder[index+1..<inorder.count]))
        return root
    }
    
    
}
