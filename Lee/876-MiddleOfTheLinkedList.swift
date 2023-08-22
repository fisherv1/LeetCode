//
//  876-MiddleOfTheLinkedList.swift
//  Lee
//
//  Created by Matthew Lu on 21/5/22.
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
class Solution_876 {
      class ListNode {
         public var val: Int
         public var next: ListNode?
         public init() { self.val = 0; self.next = nil; }
         public init(_ val: Int) { self.val = val; self.next = nil; }
         public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
     }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while (fast?.next?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    
}
