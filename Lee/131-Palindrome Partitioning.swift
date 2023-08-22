//
//  131-Palindrome Partitioning.swift
//  Lee
//
//  Created by Matthew Lu on 19/8/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

/* 131. Palindrome Partitioning
 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return all possible palindrome partitioning of s.
 Example:

 Input: "aab"
 Output:
 [
 ["aa","b"],
 ["a","a","b"]
 ]

 链接：https://leetcode-cn.com/problems/palindrome-partitioning
 */

class Solution_131 {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var candidate = [String]()
        backtracking(&result, &candidate, Array(s), 0)

        print("final result", result)
        return result
    }

    private func backtracking(_ result: inout [[String]], _ candidate: inout [String], _ characters: [Character], _ start: Int ) {

        print("result", result, "--candidate", candidate, "---start", start)

        if start == characters.count {
            result.append(candidate)
        } else {
            for i in start..<characters.count {
                if isPalindrome(characters, start, i) {
                    let character = String(characters[start...i])
                    candidate.append(character)
                    backtracking(&result, &candidate, characters, i + 1)
                    candidate.removeLast()
                }
            }
        }
    }



    private func isPalindrome(_ chars: [Character], _ low: Int, _ high: Int) -> Bool {
        var low = low
        var high = high
        while low < high {
            if chars[low] != chars[high] {
                return false
            }
            low += 1
            high -= 1
        }
        return true
    }
}
