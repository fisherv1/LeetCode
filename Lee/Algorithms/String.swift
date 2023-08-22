//
//  String.swift
//  Lee
//
//  Created by Matthew Lu on 21/5/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

import Foundation


class SwiftString {

     func addBinary(_ a: String, _ b: String) -> String {
         var lhs: [Character] = a.reversed()
         var rhs: [Character] = b.reversed()
         // zero padding
         if lhs.count < rhs.count {
             lhs.append(contentsOf: String(repeating: "0", count: rhs.count - lhs.count))
         }
         else if rhs.count < lhs.count {
             rhs.append(contentsOf: String(repeating: "0", count: lhs.count - rhs.count))
         }
         // adding
         let len = lhs.count
         var step = 0
         var result = ""
         for i in 0..<len {
             switch (lhs[i], rhs[i], step) {
             case ("0", "0", 0):
                 result.append("0")
                 step = 0
             case ("0", "0", 1):
                 fallthrough
             case ("0", "1", 0):
                 fallthrough
             case ("1", "0", 0):
                 result.append("1")
                 step = 0
             case ("1", "1", 0):
                 fallthrough
             case ("1", "0", 1):
                 fallthrough
             case ("0", "1", 1):
                 result.append("0")
                 step = 1
             case ("1", "1", 1):
                 result.append("1")
                 step = 1
             default: fatalError()
             }
         }
         if step == 1 {
             result.append("1")
         }
         while result.last == "0" {
             result.removeLast()
         }
         if result == "" {
             result = "0"
         }
         return String(result.reversed())
     }


    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {
            return 0
        }
        guard haystack.contains(needle) else { return -1 }
        let haystacks: [Character] = Array(haystack)
        let needles: [Character] = Array(needle)




//        if let firstIndex = haystack.firstIndex(of: needles.first!) {
////            haystacks[firstIndex..needles.count]
//            let index = haystack.index(firstIndex, offsetBy: needles.count)
//            let subString = haystack[..<index]
//
//            if subString == needle {
//                return 
//            }
//        }



        var firstIndex = -1
        for hIndex in 0..<haystacks.count {
            if firstIndex != -1 { return firstIndex }
            var index = hIndex
            for i in 0..<needle.count {
                if haystacks[index] == needles[i] {
                    if firstIndex < 0 {
                        firstIndex = hIndex
                    }
                    index += 1
                } else {
                    firstIndex = -1
                    break
                }
            }
        }
        return firstIndex
    }


    func longestCommonPrefix( strs: [String]) -> String {
        guard strs.count > 0 else {return ""}

        var prefix = strs.first!

        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix)  {
                guard prefix.count - 1 >= 0 else {return ""}
                prefix = String(prefix.prefix(prefix.count - 1))
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        return prefix
    }

    func longestCommonPrefix2(strs: [String]) -> String {
        guard strs.count > 0 else {return ""}

        return longestCommonPrefix2(strs: strs, l: 0, r: strs.count - 1)
    }

    func longestCommonPrefix2(strs: [String], l: Int, r: Int) -> String {

        if l == r {
            return strs[l]
        } else {
            let mid = (l + r) / 2
            let lcpLeft = longestCommonPrefix2(strs: strs, l: l, r: mid)
            let lcpRight = longestCommonPrefix2(strs: strs, l: mid + 1, r: r)
            return commonPrefix(lcpLeft, lcpRight)

        }
    }


    func commonPrefix(_ left: String, _ right: String) -> String{
        let minStringCount = min(left.count, right.count)

        let leftChars : [Character] = Array(left)
        let rightChars : [Character] = Array(right)

        for i in 0..<minStringCount {
            if leftChars[i] != rightChars[i] {
                return String(leftChars.prefix(i))
            }
        }

        return String(left.prefix(minStringCount))
    }


    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {return ""}
        var minLen = Int.max

        minLen = strs.sorted().first!.count

        var low = 1
        var high = minLen

        while low <= high {
            let middle = (low + high) / 2

            if isCommonPrefix(strs: strs, len: middle) {
                low = middle + 1
            } else {
                high = middle - 1
            }

        }
        return String(strs[0].prefix((low + high) / 2))

    }


    func isCommonPrefix(strs: [String], len: Int) -> Bool {

        let str1 = String(strs[0].prefix(len))

        for i in 1..<strs.count {
            if !strs[i].hasPrefix(str1) {
                return false
            }
        }
        return true
    }

}


//class Solution {
//    func longestCommonPrefix(_ strs: [String]) -> String {
//
//        var longestCommonPrefix = ""
//
//        guard strs.count > 0 else { return longestCommonPrefix }
//
//        var index = 0
//
//        let firstStr: [Character] = Array(strs.first!)
//
//        for i in 0..<firstStr.count {
//            for j in 1..<strs.count {
//                if index >= strs[j].count || firstStr[index] != Array(strs[j])[index] {
//                    return longestCommonPrefix
//                }
//            }
//            longestCommonPrefix.append(firstStr[index])
//            index += 1
//        }
//
//        return longestCommonPrefix
//
//    }
//}
