//
//  795-Number of Subarrays with Bounded Maximum.swift
//  Lee
//
//  Created by Matthew Lu on 1/6/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an integer array nums and two integers left and right, return the number of contiguous non-empty subarrays such that the value of the maximum array element in that subarray is in the range [left, right].
//
//The test cases are generated so that the answer will fit in a 32-bit integer.
//
//Example 1:
//
//Input: nums = [2,1,4,3], left = 2, right = 3
//Output: 3
//Explanation: There are three subarrays that meet the requirements: [2], [2, 1], [3].
//Example 2:
//
//Input: nums = [2,9,2,5,6], left = 2, right = 8
//Output: 7
class Solution_795 {
    func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var nResult = 0
         var nIndexLastLargerThanRight = -1 //最后一个大于Right的元素的Index
         var nIndexLastInRange = -1 //最后一个在[L, R]的元素的Index

         for i in 0..<nums.count
         {
             if nums[i]>right
             {
                 nIndexLastLargerThanRight = i
             }
             else if nums[i]<left
             {
                 if (nIndexLastInRange != -1) && (nIndexLastInRange > nIndexLastLargerThanRight)
                 {//当之前已经存在一个在[L, R]里的元素，并且该元素在最后一个大于R的元素之后，则可以组成符合要求的区间
                 //统计区间的方法是：每增加一个当前元素(小于left的数)，则增加 (nIndexLastInRange - nIndexLastLargerThanRight)个区间
                     nResult += (nIndexLastInRange - nIndexLastLargerThanRight)
                 }
             }
             else
             {//在[L, R]之间的元素。统计区间的方法是：每增加一个当前元素(位于[L, R]的元素)，则增加 (i - nIndexLastLargerThanRight)个区间
                 nIndexLastInRange = i
                 nResult += (i - nIndexLastLargerThanRight)
             }
         }
         return nResult
    }
}
