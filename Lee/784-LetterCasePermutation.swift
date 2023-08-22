//
//  784-LetterCasePermutation.swift
//  Lee
//
//  Created by Matthew Lu on 27/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given a string s, you can transform every letter individually to be lowercase or uppercase to create another string.
//
//Return a list of all possible strings we could create. Return the output in any order.
//
//Example 1:
//
//Input: s = "a1b2"
//Output: ["a1b2","a1B2","A1b2","A1B2"]
//Example 2:
//
//Input: s = "3z4"
//Output: ["3z4","3Z4"]
class Solution_784 {
    func letterCasePermutation(_ s: String) -> [String] {
            var s = s
           var ans: [String] = []
           dfs(s: &s, idx: 0, ans: &ans)
           return ans
    }
    
    func dfs(s: inout String, idx: Int, ans: inout [String]) {
        var chars = [Character](s)
        
        if idx == chars.count {
            ans.append(s)
            return
        }
        // 不论是 数字还是字母都会继续递归
        dfs(s: &s, idx: idx + 1, ans: &ans)

        let char = chars[idx]
        if char.isLetter {
            // 变换大小写
            if let newascii = char.asciiValue {
                chars[idx] = Character(UnicodeScalar(newascii ^ 32))
                s = String(chars)
            }
            // 字母第二次递归
            dfs(s: &s, idx: idx + 1, ans: &ans)
        }
    }
}
