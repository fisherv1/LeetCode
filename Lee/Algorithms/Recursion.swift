////
////  Recursion.swift
////  Lee
////
////  Created by Matthew Lu on 13/4/20.
////  Copyright © 2020 Matthew Lu. All rights reserved.
////
//
//import Foundation
//
//class Solution {
//    func reverseString(_ s: inout [Character]) {
//        helper(0,&s)
//    }
//
//    func helper(_ index: Int, _ s: inout [Character]) {
//        guard index >= s.count else {return}
//        let length = s.count / 2
//        helper(index + 1, &s)
//        if length - index <= index {
//            s.swapAt(length - index, index)
//        }
//    }
//
//    func generate(_ numRows: Int) -> [[Int]] {
//        var result: [[Int]] = [[Int]]()
//        guard numRows > 0 else {return result}
//        for row in 1...numRows {
//            var rowResult: [Int] = [Int]()
//            for column in 1...row {
//                let rowInt = calculate(row, column)
//                rowResult.append(rowInt)
//            }
//             result.append(rowResult)
//        }
//
//       return result
//    }
//
//    func calculate(_ row: Int, _ column: Int) -> Int {
//        if column == row || column == 1 { return 1 }
//        return calculate(row - 1, column - 1) + calculate(row - 1, column)
//    }
//
////    func getRow(_ rowIndex: Int) -> [Int] {
////        guard rowIndex >
////        var pre = 1
////        var cur = [Int]()
////
////        cur.append(1)
////
////        for i in 1...rowIndex {
////            for j in 1..<i {
////                let temp = cur[j]
////                cur[j] = pre + cur[j]
////                pre = temp
////            }
////            cur.append(1)
////        }
////        return cur
////    }
//}
