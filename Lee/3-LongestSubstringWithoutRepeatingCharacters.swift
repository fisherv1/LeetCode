//
//  3-LongestSubstringWithoutRepeatingCharacters.swift
//  Lee
//
//  Created by Matthew Lu on 28/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

class Solution_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count < 2 {
            return s.count
        }
        
        let chars: [Character] = Array<Character>(s)
        
        var map = [Character: Int]()
        var maxLen = 0
        var start = 0
    
        for i in 0..<chars.count {
            let char = chars[i]
            
            if let preIdx = map[char] {
                start = max(start, preIdx + 1) // //"abba"的情况, 所以用max()
            }
            maxLen = max(maxLen, i-start+1)
            map[char] = i
            
            //print("\(chs[0...i])的最长无重复子串长度是\(maxLen), start=\(start)")
 
        }
        return maxLen
    }
}
