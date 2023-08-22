//
//  502-NextGreaterElement2.swift
//  Lee
//
//  Created by Matthew Lu on 28/4/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
class Solution_503 {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack: [Int] = []
        var res = nums
        
        let n = nums.count
        
        var i = 2 * n - 1
        while i >= 0 {
           let e = nums[i % n]
            while !stack.isEmpty && stack.last! <= e {
                stack.removeLast()
            }
            
            res[i % n] = stack.isEmpty ? -1 : stack.last!
            stack.append(e)
            i -= 1
            
        }
        return res
    }
}
