//
//  Design.swift
//  Test
//
//  Created by Matthew Lu on 26/2/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

import Foundation

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?

    public init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
    
}

class MyLinkedList {
    var head: LinkedListNode<Int>?

    /** Initialize your data structure here. */
    init() {
        head = nil
    }

    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        let node = nodeAtIndex(index: index)

        return node == nil ? -1 : node!.value
    }

    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        if head == nil {
            head = LinkedListNode(value: val, next: head)
        } else {
            let tempHead = head
            head = LinkedListNode(value: val, next: head)
            head?.next = tempHead
        }
    }

    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        var currentNode = head
        while  currentNode?.next != nil {
            currentNode = currentNode!.next
        }
        currentNode?.next = LinkedListNode(value: val)
    }

    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            self.addAtHead(val)
        } else {
            let previousNode = nodeAtIndex(index: index - 1)
            previousNode?.next = LinkedListNode(value: val, next: previousNode?.next)

        }
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {

        if index == 0 {
            head = head?.next
        } else {
            let previousNode = nodeAtIndex(index: index - 1)
            previousNode?.next = previousNode?.next?.next
        }
    }

    func nodeAtIndex(index: Int) -> LinkedListNode<Int>? {
        var currentNode = head
        var currentIndex = 0

        while  currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
}

extension MyLinkedList {
    func hasCycle(_ head: LinkedListNode<Int>?) -> Bool {
        guard head != nil,  head?.next != nil else { return false }

        var fast = head?.next
        var slow = head

        while (slow !== fast) {
            if fast == nil || fast?.next == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
       return true
    }


    func detectCycle(_ head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        var fast = head
        var slow = head


        while fast != nil || fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                break
            }
        }

        if fast == nil || fast?.next == nil {
            return nil
        }

        fast = head
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }

        return fast
    }

    func getIntersectionNode(_ headA: LinkedListNode<Int>?, _ headB: LinkedListNode<Int>?) -> LinkedListNode<Int>? {

        var pa = headA
        var pb = headB

        while pa !== pb {
            pa = pa == nil ? headB : pa?.next
            pb = pb == nil ? headA : pb?.next
        }

        return pa
    }

    func removeNthFromEnd(_ head: LinkedListNode<Int>?, _ n: Int) -> LinkedListNode<Int>? {

             var prev: LinkedListNode<Int>? = LinkedListNode(value: 0)
             prev?.next = head

             var pointerA = prev
             var pointerB = prev
             var currentIndex = 0

             while currentIndex <= n  {
                 pointerB = pointerB?.next
                 currentIndex = currentIndex + 1
             }

             while pointerB != nil {
                 pointerA = pointerA?.next
                 pointerB = pointerB?.next
             }

             pointerA?.next = pointerA?.next?.next

             return prev?.next

    }

    func reverseList(_ head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        var prev: LinkedListNode<Int>? = nil
        var curr = head

        while curr != nil {
            let nextTemp = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextTemp
        }

        return prev
    }

    func removeElements(_ head: LinkedListNode<Int>?, _ val: Int) -> LinkedListNode<Int>?{

        var dummyHead = LinkedListNode.init(value: -1, next: head)

        var prev: LinkedListNode? = dummyHead
        var currentNode = head

        while currentNode != nil {
            if currentNode?.value == val {
                prev?.next = currentNode?.next
            } else {
                prev = currentNode
            }
            currentNode = currentNode?.next
        }

        return dummyHead.next
    }

    func mergeTwoLists(_ l1: LinkedListNode<Int>?, _ l2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {

        let newList =  LinkedListNode(value: 0)

        var leftL = l1
        var rightL = l2
        var tempNode: LinkedListNode? = newList

        while leftL != nil && rightL != nil {
            if leftL!.value < rightL!.value {
                tempNode?.next = leftL
                leftL = leftL?.next
            } else if leftL!.value > rightL!.value {
                tempNode?.next = rightL
                rightL = rightL?.next
            } else {
            tempNode?.next = leftL
            tempNode?.next?.next = rightL
            tempNode = tempNode?.next
            leftL = leftL?.next
            rightL = rightL?.next
            }
        }

        while leftL != nil {
             tempNode?.next = leftL
             leftL = leftL?.next
        }

         while rightL != nil {
             tempNode?.next = rightL
             rightL = rightL?.next
        }

        return newList.next

    }


}


/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
