//
//  206-ReverseLinkedList.swift
//  Lee
//
//  Created by Matthew Lu on 26/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

//Given the head of a singly linked list, reverse the list, and return the reversed list.
//Example 1:
//
//Input: head = [1,2,3,4,5]
//Output: [5,4,3,2,1]
//Example 2:
//
//
//Input: head = [1,2]
//Output: [2,1]
//Example 3:
//
//Input: head = []
//Output: []

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
class Solution_206 {
     public class ListNode {
         public var val: Int
         public var next: ListNode?
         public init() { self.val = 0; self.next = nil; }
         public init(_ val: Int) { self.val = val; self.next = nil; }
         public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
     }
    
    func reverseList(_ head: ListNode?) -> ListNode? {

        guard let head = head, head.next != nil else {
            return head
        }

        let newHead = reverseList(head.next)
        head.next?.next = head
        head.next = nil
        return newHead
    }
}

