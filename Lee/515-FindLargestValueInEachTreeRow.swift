//
//  515-FindLargestValueInEachTreeRow.swift
//  Lee
//
//  Created by Matthew Lu on 28/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

// Definition for a binary tree node.

 
class Solution_515 {
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
    
    
    func largestValues(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        findValue(root, result: &result, depth: 0)
        return result
    }
    
    
    private func findValue(_ root: TreeNode?, result: inout [Int], depth: Int) {
            guard let root = root else { return }
             while result.count < depth + 1 {
             result.append(Int.min)
           }

            result[depth] = max(result[depth], root.val)
            
            let leftNode = root.left
            let rightNode = root.right
            
            findValue(leftNode, result: &result, depth: depth + 1)
            
            findValue(rightNode, result: &result, depth: depth + 1)
        
    }
    
}
