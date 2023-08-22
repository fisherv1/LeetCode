//
//  19-RemoveNthNodeFromEndOfList.swift
//  Lee
//
//  Created by Matthew Lu on 21/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//19. Remove Nth Node From End of List
//Given the head of a linked list, remove the nth node from the end of the list and return its head.

//Example 1:
//Input: head = [1,2,3,4,5], n = 2
//Output: [1,2,3,5]
//
//Example 2:
//Input: head = [1], n = 1
//Output: []
//
//Example 3:
//Input: head = [1,2], n = 1
//Output: [1]

class Solution_19 {
     public class ListNode {
         public var val: Int
         public var next: ListNode?
         public init() { self.val = 0; self.next = nil; }
         public init(_ val: Int) { self.val = val; self.next = nil; }
         public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
     }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        if n == 0 {
            return head
        }
        
        let dummyHead = ListNode(-1, head)
        
        var slow: ListNode? = dummyHead
        var fast: ListNode? = dummyHead
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        return dummyHead.next
    }
    
}
