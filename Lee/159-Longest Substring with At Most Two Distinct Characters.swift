//
//  159-Longest Substring with At Most Two Distinct Characters.swift
//  Lee
//
//  Created by Matthew Lu on 1/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
class Solution_159 {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        let n = s.count
        if n < 3 {
            return n
        }
        // sliding window left and right pointers
        var left = 0
        var right = 0
        
        // hashmap character -> its rightmost position
           // in the sliding window
        var hashMap: [Character: Int] = [:]
        
        var max_len = 2
        let s = Array(s)
        
        while right < n {
            // slidewindow contains less than 3 characters
            if hashMap.count < 3 {
                hashMap[s[right]] = right
                right += 1
            }
            
            // slidewindow contains 3 characters
            if hashMap.count == 3 {
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
