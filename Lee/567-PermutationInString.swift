//
//  567-PermutationInString.swift
//  Lee
//
//  Created by Matthew Lu on 22/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

//Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
//
//In other words, return true if one of s1's permutations is the substring of s2.
//
//
//Example 1:
//
//Input: s1 = "ab", s2 = "eidbaooo"
//Output: true
//Explanation: s2 contains one permutation of s1 ("ba").
//Example 2:
//
//Input: s1 = "ab", s2 = "eidboaoo"
//Output: false

class Solution_567 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count {
                   return false
               }
               let n = s1.count
               let m = s2.count
               let sArray1 = Array(s1)
               let sArray2 = Array(s2)
               // 256位ASCII码
               var cnt:[Int] = Array(repeating: 0, count: 256)
               
               var diff = 0
               
               // 统计cnt = cnt2-cnt1
               for i in 0..<n {
                   let index1 = Int(sArray1[i].asciiValue!)
                   let index2 = Int(sArray2[i].asciiValue!)
                   cnt[index1] -= 1
                   cnt[index2] += 1
               }
               
               // 计算diff
               for i in 0..<cnt.count {
                   if cnt[i] != 0 {
                       diff += 1
                   }
               }
               
               if diff == 0 {
                   return true
               }
               
               // 滑动窗口
               for i in n..<m {
                   let x = Int(sArray2[i].asciiValue!)
                   let y = Int(sArray2[i-n].asciiValue!)
                   
                   if x==y {
                       continue
                   }
                   
                   if cnt[x] == 0 {
                       diff += 1
                   }
                   // 更新
                   cnt[x] += 1
                   if cnt[x] == 0 {
                       diff -= 1
                   }
                   
                   if cnt[y] == 0 {
                       diff += 1
                   }
                   
                   cnt[y] -= 1
                   if cnt[y] == 0 {
                       diff -= 1
                   }
                   
                   if diff == 0 {
                       return true
                   }
                   
                   
               }
               
               return false
    }
}
