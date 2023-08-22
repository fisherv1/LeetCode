//
//  704-BinarySearch.swift
//  Lee
//
//  Created by Matthew Lu on 17/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation

class Solution_704 {
    func search(_ nums: [Int], _ target: Int) -> Int {

      var low = 0
        var high = nums.count - 1
        
        while (low <= high) {
            
            let mid =  (high - low ) / 2 + low
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] <= target {
                high = mid - 1
            } else {
                low = mid + 1
            }
            
        }
        return -1
    }


}
