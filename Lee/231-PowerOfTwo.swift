//
//  231-PowerOfTwo.swift
//  Lee
//
//  Created by Matthew Lu on 29/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Given an integer n, return true if it is a power of two. Otherwise, return false.
//
//An integer n is a power of two, if there exists an integer x such that n == 2x.
//
//
//Example 1:
//
//Input: n = 1
//Output: true
//Explanation: 20 = 1
//Example 2:
//
//Input: n = 16
//Output: true
//Explanation: 24 = 16
//Example 3:
//
//Input: n = 3
//Output: false


class Solution_231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
       return n > 0 && n & (n - 1) == 0
    }
}


//若 n = 2^xn=2
//x
//  且 xx 为自然数（即 nn 为 22 的幂），则一定满足以下条件：
//恒有 n & (n - 1) == 0，这是因为：
//nn 二进制最高位为 11，其余所有位为 00；
//n - 1n−1 二进制最高位为 00，其余所有位为 11；
//一定满足 n > 0。
//因此，通过 n > 0 且 n & (n - 1) == 0 即可判定是否满足 n = 2^xn=2
//x
