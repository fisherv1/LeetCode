//
//  1052-GrumpyBookstoreOwner.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//There is a bookstore owner that has a store open for n minutes. Every minute, some number of customers enter the store. You are given an integer array customers of length n where customers[i] is the number of the customer that enters the store at the start of the ith minute and all those customers leave after the end of that minute.
//
//On some minutes, the bookstore owner is grumpy. You are given a binary array grumpy where grumpy[i] is 1 if the bookstore owner is grumpy during the ith minute, and is 0 otherwise.
//
//When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise, they are satisfied.
//
//The bookstore owner knows a secret technique to keep themselves not grumpy for minutes consecutive minutes, but can only use it once.
//
//Return the maximum number of customers that can be satisfied throughout the day.
//
//
//
//Example 1:
//
//Input: customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], minutes = 3
//Output: 16
//Explanation: The bookstore owner keeps themselves not grumpy for the last 3 minutes.
//The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.
//Example 2:
//
//Input: customers = [1], grumpy = [0], minutes = 1
//Output: 1

class Solution_1052 {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
        
        var sum = 0
        // 所有不生气时间内的顾客总数
        for i in 0..<customers.count {
            if grumpy[i] == 0 {
                sum += customers[i]
            }
        }
        //生气的 X 分钟内，会让多少顾客不满意
        
        var curValue = 0
        
        // 先计算起始的 [0, X) 区间
        for i in 0..<minutes {
            if grumpy[i] == 1 {
                curValue += customers[i]
            }
        }
        
        var resValue = curValue
        
        // 然后利用滑动窗口，每次向右移动一步
        for i in minutes..<customers.count {
            // 如果新进入窗口的元素是生气的，累加不满意的顾客到滑动窗口中
            if grumpy[i] == 1 {
                curValue += customers[i]
            }
            //如果离开窗口的元素是生气的，则从滑动窗口中减去该不满意的顾客数
            
            if grumpy[i - minutes] == 1 {
                curValue -= customers[i - minutes]
            }
            //求所有窗口内不满意顾客的最大值
            resValue = max(curValue, resValue)
        }
        // 最终结果是：不生气时的顾客总数 + 窗口X内挽留的因为生气被赶走的顾客数
        return resValue + sum
    }
}
