//
//  Tree.swift
//  Lee
//
//  Created by Matthew Lu on 19/6/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

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



extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
}

class Solution {

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {return []}

        var stack: [TreeNode] = []
        var result: [Int] = []
        stack.append(root)

        while let node = stack.popLast() {

            result.append(node.val)

            if let right = node.right {
                stack.append(right)
            }

            if let left = node.left {
                stack.append(left)
            }
        }
        return result
    }

    // Morris
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return []}
        var output: [Int] = []

        var node:TreeNode?  = root

    
        while node != nil {
            if node!.left == nil {
                output.append(node!.val)
                node = node!.right
            } else {
                var predecessor: TreeNode? = node!.left

                while predecessor?.right != nil && predecessor?.right != node {
                    predecessor = predecessor?.right
                }

                if predecessor?.right == nil {
                    output.append(node!.val)
                    predecessor?.right = node
                    node = node!.left
                } else {
                    predecessor?.right = nil
                    node = node!.right
                }

            }
        }
        return output

    }



        var levels: [[Node]] = []
        func connect(_ root: Node?) -> Node? {

            guard let root = root else {return nil }


            addToLevel(root, 0)

            for nodes in levels {
              for i in 0..<nodes.count {
                  if i + 1 < nodes.count {
                      nodes[i].next = nodes[i + 1]
                  } else {
                      nodes[i].next = nil
                  }
                }
            }

            return root
        }

        func addToLevel(_ node: Node, _ level: Int) {

            if levels.count == level {
                levels.append([])
            }

            levels[level].append(node)

            if let left = node.left {
                addToLevel(left, level + 1)
            }

            if let right = node.right {
                addToLevel(right, level + 1)
            }
        }

        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

              guard let root = root, let p = p, let q = q else {return nil}

              if (root.left?.val == p.val && root.right?.val == q.val) || (root.left?.val == q.val && root.right?.val == p.val) {
                  return root
              }

              let leftTreeNode = lowestCommonAncestor(root.left, p, q)
              let rightTreeNode = lowestCommonAncestor(root.right, q, p)
              return leftTreeNode != nil ? leftTreeNode: rightTreeNode
          }

}
