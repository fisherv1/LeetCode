//
//  17-17. Letter Combinations of a Phone Number.swift
//  Lee
//
//  Created by Matthew Lu on 2/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//Example 1:
//
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
//Example 2:
//
//Input: digits = ""
//Output: []
//Example 3:
//
//Input: digits = "2"
//Output: ["a","b","c"]

class Solution_17 {
    func letterCombinations(_ digits: String) -> [String] {
        var m = ["2": "abc",
                 "3": "def",
                 "4": "ghi",
                 "5": "jkl",
                 "6": "mno",
                 "7": "pqrs",
                 "8": "tuv",
                 "9": "wxyz"]
        
        var digits = digits.map({ (i: Character) -> String in return m[String(i)]! })
        
        print("gg digits", digits)
        
        var arr = [String]()
        func loop(_ s: String, _ h: Int) {
            if digits.count <= h {
                if s != "" { arr.append(s) }
                return
            }
            for i in digits[h] {
                loop(s + String(i), h + 1)
            }
        }
        
        loop("", 0)
        return arr
    }

}


