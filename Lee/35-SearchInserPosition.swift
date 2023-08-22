//
//  35-SearchInserPosition.swift
//  Lee
//
//  Created by Matthew Lu on 17/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation


class Solution_35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
              var high = nums.count - 1
              var ans = nums.count

              while low <= high {
                  let mid = low + (high - low) / 2
                  let num = nums[mid]
                  if (target <= num) {
                      ans = mid
                      high = mid - 1
                  } else {
                      low = mid + 1
                  }
              }

              return ans
    }
}
