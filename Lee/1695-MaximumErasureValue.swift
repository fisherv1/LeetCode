//
//  1695-MaximumErasureValue.swift
//  Lee
//
//  Created by Matthew Lu on 22/6/2022.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//You are given an array of positive integers nums and want to erase a subarray containing unique elements. The score you get by erasing the subarray is equal to the sum of its elements.
//
//Return the maximum score you can get by erasing exactly one subarray.
//
//An array b is called to be a subarray of a if it forms a contiguous subsequence of a, that is, if it is equal to a[l],a[l+1],...,a[r] for some (l,r).
//
//
//Example 1:
//
//Input: nums = [4,2,4,5,6]
//Output: 17
//Explanation: The optimal subarray here is [2,4,5,6].
//Example 2:
//
//Input: nums = [5,2,1,2,5,2,1,2,5]
//Output: 8
//Explanation: The optimal subarray here is [5,2,1] or [1,2,5].

class Solution_1695 {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var i = 0, j = 0, count = [Int](repeating: 0, count: 10000), duplicate = 0, ans = 0, sum = 0
        while j < nums.count {
            while j < nums.count, duplicate == 0 {
                let J = nums[j] - 1
                count[J] += 1
                if count[J] == 2 { duplicate += 1 }
                sum += nums[j]
                j += 1
            }
            ans = max(ans, sum - nums[j - 1])
            while i < j, duplicate > 0 {
                let I = nums[i] - 1
                count[I] -= 1
                if count[I] == 1 { duplicate -= 1 }
                sum -= nums[i]
                i += 1
            }
            ans = max(ans, sum)
        }
        return ans
    }
}
