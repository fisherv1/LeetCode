//
//  167-TwoSum2.swift
//  Lee
//
//  Created by Matthew Lu on 28/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

class Solution_167 {
    
    //双指针
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var low = 0
        var high = numbers.count - 1
        
        while low < high {
            let sum = numbers[low] + numbers[high]
            if numbers[low] + numbers[high] == target {
                return [low + 1, high + 1]
            }
            else if sum < target  {
                low += 1
            } else {
                high -= 1
            }
        }
        
        return [-1, -1]
    }
    
}


//二分查找
//func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
//
//     for i in 0..<numbers.count-1 {
//
//       var left = i+1
//       var right = numbers.count-1
//
//       while left<=right {
//         let mid = (left+right)/2
//
//         if numbers[mid] < target-numbers[i] {
//           left = mid+1
//         } else if numbers[mid] > target-numbers[i] {
//           right = mid-1
//         } else {
//           return [i+1,mid+1]
//         }
//
//       }
//
//     }
//
//     return [-1,-1]
//   }
