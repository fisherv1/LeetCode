//
//  242-Valid Anagram.swift
//  Lee
//
//  Created by Matthew Lu on 7/9/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//
/*
Given two strings s and t , write a function to determine if t is an anagram of s.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
Note:
You may assume the string contains only lowercase alphabets.

Follow up:
What if the inputs contain unicode characters? How would you adapt your solution to such case?

*/

import Foundation

class Solution_242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false}

        var counter = [Int](repeating: 0, count: 26)

        let aCharUnicodeScalar = Int("a".unicodeScalars.first!.value)

        for scalar in s.unicodeScalars {
            counter[Int(scalar.value) - aCharUnicodeScalar] += 1
        }
        for scalar in t.unicodeScalars {
            counter[Int(scalar.value) - aCharUnicodeScalar] -= 1
        }

        return counter.first(where: { $0 != 0 }) == nil

    }
}
