//
//  344-Reverse String.swift
//  Lee
//
//  Created by Matthew Lu on 10/9/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//
/*
 344. Reverse String

 Write a function that reverses a string. The input string is given as an array of characters char[].

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.


 Example 1:

 Input: ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]

 */


class Solution_344 {
    func reverseString(_ s: inout [Character]) {
        var startIndex = 0
        var endIndex = s.count - 1

        while startIndex < endIndex {
            s.swapAt(startIndex, endIndex)
            startIndex += 1
            endIndex -= 1
        }
    }
}
