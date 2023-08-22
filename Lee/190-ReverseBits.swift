//
//  190-ReverseBits.swift
//  Lee
//
//  Created by Matthew Lu on 30/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//Reverse bits of a given 32 bits unsigned integer.
//
//Note:
//
//Note that in some languages, such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
//In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer -3 and the output represents the signed integer -1073741825.
//
//
//Example 1:
//
//Input: n = 00000010100101000001111010011100
//Output:    964176192 (00111001011110000010100101000000)
//Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
//Example 2:
//
//Input: n = 11111111111111111111111111111101
//Output:   3221225471 (10111111111111111111111111111111)
//Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.

class Solution_190 {
    
//    将n视作一个长为32的二进制串，从低位往高位枚举n的每一位，将其倒序添加到翻转结果rev中。
//
//    颠倒二进制，即 原本的最低位，会到最高位
//    n对2取余，即可获得最低位的数值
//    每次将最低位转到最高位后，重新赋值n = n/2 直到n为0
//    由于是32位，第一次取余后的值乘以2的31次方即到最高位 第二次是乘以2的30次方...

    
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var rev = 0
        var count = 0
        while n > 0 {
            let a = n%2
            rev += a * 1<<(31-count)
            n = n/2
            count += 1
        }
        return rev
    }
    
    
    
//思路2:位运算分治
//对于递归的最底层，我们需要交换所有奇偶位：
//
//取出所有奇数位和偶数位；
//将奇数位移到偶数位上，偶数位移到奇数位上。
//类似地，对于倒数第二层，每两位分一组，按组号取出所有奇数组和偶数组，然后将奇数组移到偶数组上，偶数组移到奇数组上。以此类推。

    
    func reverseBits1(_ n: Int) -> Int {
        var n = n
              //交换左右两边16位数
              n = (n >> 16) | (n << 16)
              //交换左右两边8位数
              n = ((n & 0b1111_1111_0000_0000_1111_1111_0000_0000) >> 8)
                | ((n & 0b0000_0000_1111_1111_0000_0000_1111_1111) << 8)
              //交换左右两边4位数
              n = ((n & 0b1111_0000_1111_0000_1111_0000_1111_0000) >> 4)
                | ((n & 0b0000_1111_0000_1111_0000_1111_0000_1111) << 4)
              //交换左右两边2位数
              n = ((n & 0b1100_1100_1100_1100_1100_1100_1100_1100) >> 2)
                | ((n & 0b0011_0011_0011_0011_0011_0011_0011_0011) << 2)
              //交换左右两边1位数
              n = ((n & 0b1010_1010_1010_1010_1010_1010_1010_1010) >> 1)
                | ((n & 0b0101_0101_0101_0101_0101_0101_0101_0101) << 1)

              return n
    }
    
}
