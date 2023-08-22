//
//  340-Longest Substring with At Most K Distinct Characters.swift
//  Lee
//
//  Created by Matthew Lu on 1/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.
//
//Example 1:
//
//Input: s = "eceba", k = 2
//Output: 3
//Explanation: The substring is "ece" with length 3.
//Example 2:
//
//Input: s = "aa", k = 1
//Output: 2
//Explanation: The substring is "aa" with length 2.
class Solution_340 {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        let n = s.count
        if n < (k + 1) {
            return n
        }
        // sliding window left and right pointers
        var left = 0
        var right = 0
        
        // hashmap character -> its rightmost position
        // in the sliding window
        var hashMap: [Character: Int] = [:]
        
        var max_len = k
        let s = Array(s)
        
        while right < n {
            // slidewindow contains less than 3 characters
            if hashMap.count < (k + 1) {
                hashMap[s[right]] = right
                right += 1
            }
            
            // slidewindow contains 3 characters
            if hashMap.count == (k + 1) {
                // delete the leftmost character
                let index = hashMap.values.min()!
                hashMap.removeValue(forKey: s[index])
                // move left pointer of the slidewindow
                left = index + 1
            }
            
            max_len = max(max_len, right - left)
        }
        
        return max_len
    }
}
