//
//  Find Subarray less or equal to K.swift
//  Lee
//
//  Created by Matthew Lu on 25/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//


//  Length of longest subarray of sum less than or equal to k

// s = [1,2,3], k = 4, output = 2

// s=[3,1,2,1], k = 4, output = 3



import Foundation

class Solution_less {
    
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var start = 0
        var end = 0
        var sum = 0
        
        var maxLen = -1 // returns -1 if there is no subsequence that adds up to k.
        
        for num in nums {
            sum += num
            end += 1
            
            while sum > k {
                sum -= nums[start]
                start += 1 // Shrink the array from the left, until the sum is <= k.
            }
            
            // After the previous while loop, subarray_sum is guaranteed to be
            // smaller than or equal to k.
            maxLen = max(maxLen, end - start )
            
        }
    
        
        return maxLen
     }

}
















 func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
    var maxLen = -1
     
     var sum = 0
     var start = 0
     var end = 0
     
     for num in nums {
         sum += num
         end += 1
         
         while( sum > k) {
             sum -= nums[start]
             start += 1
         }
         
         maxLen = max(maxLen, end - start)
     }
     
     return maxLen
     
 }























































