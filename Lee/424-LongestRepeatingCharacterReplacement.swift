//
//  424-LongestRepeatingCharacterReplacement.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
//
//Return the length of the longest substring containing the same letter you can get after performing the above operations.
//
//Example 1:
//
//Input: s = "ABAB", k = 2
//Output: 4
//Explanation: Replace the two 'A's with two 'B's or vice versa.
//Example 2:
//
//Input: s = "AABABBA", k = 1
//Output: 4
//Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
//The substring "BBBB" has the longest repeating letters, which is 4.

class Solution_424 {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var s = Array(s), map = [Int](repeating: 0, count: 26), i = 0, j = 0, ma = 0
             while j < s.count {
                 // 每次向右添加一个新的字母
                 let J = Int(s[j].asciiValue!) - 65
                 map[J] += 1
                 ma = max(ma, map[J])
                 j += 1
                 // 如果替换超过k个，减少一个最左边，此时无论是否超过k个，宽度仍然在历史最长上
                 // 如果后续还有更长的，则ma会倾向于更大，判定会倾向于跳过，所以长度会变长
                 // 否则直接返回历史最长
                 if j - i - ma > k {
                     let I = Int(s[i].asciiValue!) - 65
                     map[I] -= 1
                     i += 1
                 }
             }
             return j - i        
    }
}
