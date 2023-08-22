//
//  387 -  First Unique Character in a String.swift
//  Lee
//
//  Created by Matthew Lu on 9/9/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

// 387.  First Unique Character in a String
/* Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode"
return 2.

 */



import Foundation

class Solution_387 {
    func firstUniqChar(_ s: String) -> Int {
        var hashMap: [Character: Int] = [:]
        for char in s {
            hashMap[char] = (hashMap[char] ?? 0 ) + 1
        }

        for (idx, c) in s.enumerated() {
            if hashMap[c] == 1 {
                return idx
            }
        }
        return -1
    }
}
