//
//  139-Word Break.swift
//  Lee
//
//  Created by Matthew Lu on 22/8/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//


// Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

//Note:
//
//The same word in the dictionary may be reused multiple times in the segmentation.
//You may assume the dictionary does not contain duplicate words.

//Example 1:
//
//Input: s = "leetcode", wordDict = ["leet", "code"]
//Output: true
//Explanation: Return true because "leetcode" can be segmented as "leet code".
//Example 2:
//
//Input: s = "applepenapple", wordDict = ["apple", "pen"]
//Output: true
//Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
//             Note that you are allowed to reuse a dictionary word.
//Example 3:
//
//Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
//Output: false

//链接：https://leetcode-cn.com/problems/word-break

import Foundation
class Solution_139 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        var maxLen = 0
        for word in wordDict { maxLen = max(maxLen, word.count) }
        dp[0] = true
        let wordSet: Set<String> = Set<String>(wordDict)

        for i in 1..<dp.count {
            for j in 0..<i {
                if i - j > maxLen { continue }
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                let subString = String(s[start..<end])
                if dp[j] && wordSet.contains(subString) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[s.count]
    }
}
