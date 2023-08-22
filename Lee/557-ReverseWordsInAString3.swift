//
//  557-ReverseWordsInAString3.swift
//  Lee
//
//  Created by Matthew Lu on 20/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

//Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
                                                                                 
//Example 1:
//
//Input: s = "Let's take LeetCode contest"
//Output: "s'teL ekat edoCteeL tsetnoc"
//
//Example 2:
//
//Input: s = "God Ding"
//Output: "doG gniD"

class Solution_557 {
    func reverseWords(_ s: String) -> String {

        let sArray = s.components(separatedBy: " ")
        
        var resultArray: [String] = []
        for chars in sArray {
            resultArray.append(reverseWord(Array(chars)))
        }
        
        return String(resultArray.joined(separator: " "))
    }
    
    func reverseWord(_ chars: [Character]) -> String {
        var left = 0
        var right = chars.count - 1
        var newChars = chars
        while (left < right) {
            newChars.swapAt(left, right)
            left += 1
            right -= 1
        }
        return String(chars)
    }
    
}
