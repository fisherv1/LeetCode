//
//  1456-MaximumNumber ofVowelsinaSubstringofGivenLength.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.
//
//Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.
//Example 1:
//
//Input: s = "abciiidef", k = 3
//Output: 3
//Explanation: The substring "iii" contains 3 vowel letters.
//Example 2:
//
//Input: s = "aeiou", k = 2
//Output: 2
//Explanation: Any substring of length 2 contains 2 vowels.
//Example 3:
//
//Input: s = "leetcode", k = 3
//Output: 2
//Explanation: "lee", "eet" and "ode" contain 2 vowels.


class Solution_1456 {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        let SArray: [Character] = Array(s)
        var sum = 0
        // get first k sum
        for i in 0..<k {
            if vowels.contains(SArray[i]) {
                sum += 1
            }
        }
        
        var res = sum
        
        for i in k..<SArray.count {
            let rightElementIsVowelsCount = vowels.contains(SArray[i]) ? 1 : 0
            let leftElementIsVowelsCount = vowels.contains(SArray[i - k]) ? 1 : 0
            sum = sum + rightElementIsVowelsCount - leftElementIsVowelsCount
            res = max(sum, res)
        }
        return res
    }
}
