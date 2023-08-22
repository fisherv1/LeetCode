//
//  5-LongestPalindromicSubstring.swift
//  Lee
//
//  Created by Matthew Lu on 2/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a string s, return the longest palindromic substring in s.
//
//Example 1:
//
//Input: s = "babad"
//Output: "bab"
//Explanation: "aba" is also a valid answer.
//Example 2:
//
//Input: s = "cbbd"
//Output: "bb"

class Solution_5 {
    func longestPalindrome(_ s: String) -> String {
           if s.count < 2 {
               return s
           }
           var start = 0
           var end = 0
           var array = s.map({ String.init($0)})
           for i in 0 ..< s.count {
               let len1 = expandCenter(array: array, left: i, right: i)
               let len2 = expandCenter(array: array, left: i, right: i + 1)
               let len = max(len1, len2)
               if(len > end - start) {
                   start = i - (len - 1) / 2
                   end = i + len / 2
               }
           }
           array.removeFirst(start)
           let sub = array.prefix(end - start + 1).joined()
           return sub
       }
       
       func expandCenter(array: [String], left: Int, right: Int) -> Int {
           var l = left
           var r = right
           while l >= 0 && r < array.count && array[l] == array[r] {
               l -= 1
               r += 1
           }
           return r - l - 1
       }
    
}
