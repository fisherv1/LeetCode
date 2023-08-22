//
//  325-Maximum Size Subarray Sum Equals k.swift
//  Lee
//
//  Created by Matthew Lu on 25/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation


//解题思路：
//使用哈希表记录当前位置前缀和及下标。我们想要得到和为k的子数组，问题可以转化为寻找当前位置之前是否存在和为 curSum - k 的前缀和区间
//注意：
//由于我们想要得到最长长度，所以我们只需要记录不同sum值第一次出现的位置，特别的，当 curSum - k 为0时，确保得到最长的长度，我们应该认为初始位置（i = 0）处 前缀和为0
//


class Solution_325 {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        // 哈希表，映射前缀和值到第一次出现的下标位置
        var map: [Int: Int] = [:]
        var sum = 0
        var ans = 0
        
        for i in 0..<nums.count {
            // 累加前缀和
            sum = sum + nums[i]
            //相当于窗口右移一位
            if sum == k {
                ans = i + 1
                //有可能就是答案
            }
            // 确保记录的是第一次出现的位置
            if map[sum] == nil {
               map[sum] = i
                //后面再遇到的不用加进去，因为长度肯定大，我们要比较小的，因为这个东西是要被减去的。
            }
            
            // 检查一下是否需要更新答案
            if let value = map[sum - k]  {
                ans = max(ans, i - value)
            }
            
  
        }
        
        return ans
    }
}
