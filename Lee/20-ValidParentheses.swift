//
//  20-ValidParentheses.swift
//  Lee
//
//  Created by Matthew Lu on 30/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//
//
//Example 1:
//
//Input: s = "()"
//Output: true
//Example 2:
//
//Input: s = "()[]{}"
//Output: true
//Example 3:
//
//Input: s = "(]"
//Output: false

class Solution_20 {
    func isValid(_ s: String) -> Bool {

        var stack: [Character] = []
        
        for char in s {
            if char == "{" || char == "(" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }
                let element = stack.popLast()
                if (element == "{" && char != "}") || (element == "(" && char != ")") || (element == "[" && char != "]")   {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
