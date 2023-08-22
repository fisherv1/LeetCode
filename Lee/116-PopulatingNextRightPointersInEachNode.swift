//
//  116-PopulatingNextRightPointersInEachNode.swift
//  Lee
//
//  Created by Matthew Lu on 24/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:
//
//struct Node {
//  int val;
//  Node *left;
//  Node *right;
//  Node *next;
//}
//Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
//
//Initially, all next pointers are set to NULL.
//
//Example 1:
//Input: root = [1,2,3,4,5,6,7]
//Output: [1,#,2,3,#,4,5,6,7,#]
//Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
//
//Example 2:
//Input: root = []
//Output: []

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *       public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution_116 {
     public class Node {
         public var val: Int
         public var left: Node?
         public var right: Node?
           public var next: Node?
         public init(_ val: Int) {
             self.val = val
             self.left = nil
             self.right = nil
             self.next = nil
         }
     }
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        var queue = [Node]()
        queue.append(root)
        
        while( !queue.isEmpty) {
           var tempArray = [Node]()
            var index = 0
            
            while index < queue.count - 1 {
                let node = queue[index]
                node.next = queue[index + 1]
                index += 1
            }
            
            
            for node in queue {
                if node.left != nil {
                    tempArray.append(node.left!)
                }
                
                if node.right != nil {
                    tempArray.append(node.right!)
                }
            }
            queue = tempArray
        }
        return root
    }
}
