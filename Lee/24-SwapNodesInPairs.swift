//
//  24-SwapNodesInPairs.swift
//  Lee
//
//  Created by Matthew Lu on 28/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution_24 {
    public class ListNode {
        public var val: Int
         public var next: ListNode?
         public init() { self.val = 0; self.next = nil; }
         public init(_ val: Int) { self.val = val; self.next = nil; }
         public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
     }
    
    
    func swapPairs(_ head: ListNode?) -> ListNode? {

        if head == nil || head?.next == nil {
            return head
        }
        
        let dummyHead = ListNode(-1, head)
        
        var current: ListNode? = dummyHead
        
        while current?.next != nil && current?.next?.next != nil {
            let temp1 = current?.next
            let temp2 = current?.next?.next?.next
            
            current?.next = current?.next?.next
            current?.next?.next = temp1
            current?.next?.next?.next = temp2
            
            current = current?.next?.next
        }
        return dummyHead.next
    }
    
}


//class Solution {
//    func swapPairs(_ head: ListNode?) -> ListNode? {
//        swapHead(head)
//        return head
//    }
//    
//    func swapHead(_ node: ListNode?) {
//        guard let node = node, let nextNode = node.next else { return }
//        swapHead(nextNode.next)
//        let currNodeValue = node.val
//        node.val = nextNode.val
//        nextNode.val = currNodeValue
//     
//    }
//}
