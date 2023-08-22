//
//  140-Word Break 2.swift
//  Lee
//
//  Created by Matthew Lu on 24/8/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//
/*
Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.

Note:

The same word in the dictionary may be reused multiple times in the segmentation.
You may assume the dictionary does not contain duplicate words.
Example 1:

Input:
s = "catsanddog"
wordDict = ["cat", "cats", "and", "sand", "dog"]
Output:
[
  "cats and dog",
  "cat sand dog"
]
Example 2:

Input:
s = "pineapplepenapple"
wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
Output:
[
  "pine apple pen apple",
  "pineapple pen apple",
  "pine applepen apple"
]
Explanation: Note that you are allowed to reuse a dictionary word.
Example 3:

Input:
s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]
Output:
[]

链接：https://leetcode-cn.com/problems/word-break-ii
*/

import Foundation

class Solution_140 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var memo = [String: [String]]()
        return workBreakHelper(s, wordDict, &memo)
    }

    private func workBreakHelper(_ s: String, _ wordDict: [String], _ memo: inout [String: [String]]) -> [String] {

        if memo.keys.contains(s) {
            return memo[s]!
        }
        var results = [String]()
        if s.count == 0 {
            //Base case
            results.append("")
            return results
        }

        // Break the string apart and append the substrings to the first word
        for word in wordDict {
            if s.hasPrefix(word) {
                let startIndex = s.index(s.startIndex, offsetBy: word.count)
                let sub: String = String(s.suffix(from: startIndex))
                let subStrings: [String] = wordBreak(sub, wordDict)
                for subString in subStrings {
                    let optionalSpace = subString.isEmpty ? "" : " "
                    results.append(word + optionalSpace + subString)
                }
            }
        }

        memo[s] = results
        return results

    }
}
