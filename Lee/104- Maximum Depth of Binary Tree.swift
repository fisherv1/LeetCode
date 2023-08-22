//
//  104- Maximum Depth of Binary Tree.swift
//  Lee
//
//  Created by Matthew Lu on 4/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
/**
 * Definition for a binary tree node.

 * }
 */
class Solution_104 {
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
    func maxDepth(_ root: TreeNode?) -> Int {

        guard let root = root else {
            return 0
        }
        
        let leftMaxHeight = maxDepth(root.left)
        let rightMaxHeight = maxDepth(root.right)
        
        
        return max(leftMaxHeight, rightMaxHeight) + 1
    }
}
