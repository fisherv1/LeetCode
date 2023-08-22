//
//  215-KthLargestElementInAnArray.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an integer array nums and an integer k, return the kth largest element in the array.
//
//Note that it is the kth largest element in the sorted order, not the kth distinct element.
//
//
//
//Example 1:
//
//Input: nums = [3,2,1,5,6,4], k = 2
//Output: 5
//Example 2:
//
//Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
//Output: 4

class Solution_215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let nums = Array(nums.sorted().reversed())
        return nums[k]
    }
    
    
//    基于 快排 逻辑， 我们 找一个 坐标 q， 让 左侧 小于 该坐标元素的值的个数 正好 是 nums.count-k，那么 这个坐标就是我们要找的
    var nums: [Int]!
    
    func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
        self.nums = nums
        let res = quickSelect(0, nums.count - 1, nums.count - k)
        return res
    }
    
    func quickSelect(_ left: Int, _ right: Int, _ index: Int) ->  Int {
        //! 找到分区点
        let q = randomPartition(left, right)
        if q == index {
            return nums[q]
        } else {
            return q < index ? quickSelect(q+1, right, index) : quickSelect(left, q-1, index)
        }
    }
    
    //! 以 区间最后一个元素为锚点，依次进行比对分割，左侧比锚点小，右侧比锚点大
    func randomPartition(_ left: Int, _ right: Int) -> Int {
        if left >= right {
            return left
        }
        
        //! 参考值
        let x = nums[right]
        //! 分区边界, i 是第一个不小于 x 的坐标，也就是左边界
        
        var i = left
        for j in left..<right {
            if nums[j] < x {
                nums.swapAt(i, j)
                i += 1
            }
        }
        //! 最后 将 参考值 替换
        nums.swapAt(i, right)
        return i
    }
}
