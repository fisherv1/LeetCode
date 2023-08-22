//
//  Array.swift
//  Lee
//
//  Created by Matthew Lu on 3/5/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

import Foundation
class SwiftArray {
    func pivotIndex(_ nums: [Int]) -> Int {

        var leftIndex = 0
        var rightIndex = nums.count - 1
        var leftSum = nums[leftIndex]
        var rightSum = nums[rightIndex]
        var hasPivotIndex = false

        while leftIndex < rightIndex {
            if leftSum < rightSum {
                leftIndex = leftIndex + 1
                leftSum = leftSum + nums[leftIndex]
            } else if leftSum > rightSum {
                rightIndex = rightIndex - 1
                rightSum = rightSum + nums[rightIndex]
            } else {
                if (leftIndex + rightIndex) == nums.count {
                   hasPivotIndex = true
                   break
                }
            }
        }
        return hasPivotIndex == true ? leftIndex + 1 : -1
    }

    func dominantIndex(_ nums: [Int]) -> Int {
        if nums.count < 2  { return 0}
        
        var max_num_i = 0, sub_max_num_i = 0
        
        for i in 0..<nums.count {
            if nums[i] > nums[max_num_i] {
                sub_max_num_i = max_num_i
                max_num_i = i
            } else if sub_max_num_i == max_num_i || nums[i] > nums[sub_max_num_i] {
                sub_max_num_i = i
            }
        }
        
        if nums[max_num_i] >= nums[sub_max_num_i] * 2 {
            return max_num_i
        }
        
        return -1
    }

    func plusOne(_ digits: [Int]) -> [Int] {
        var index = digits.count - 1
        var ans = [Int](digits)
        while index > -1 {
            let value = ans[index]
            if value != 9 {
                ans[index] = value + 1
                break
            }
            ans[index] = 0
            index -= 1
        }
        if index == -1 {
            ans.insert(1, at: 0)
        }
        return ans
    }


    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {

        // check for empty matrics
        guard matrix.count > 0 else { return [0] }

        // Variables to trck the size fo the matrix
        let N = matrix.count
        let M = matrix[0].count

        var result: [Int] = Array.init(repeating: -1, count: N * M)

        var k = 0
        var intermediate: [Int] = []

        // We have to go over all the elements in the first
        // row and the last column to cover all possible diagonals
        for d in 0..<(N + M - 1) {
            // Clear the intermediate array every time we start
            // to process another diagonal
            intermediate.removeAll()

            // We need to figure out the "head" of this diagonal
            // The elements in the first row and the last column
            // are the respective heads
            var r = d < M ? 0 : d - M + 1
            var c = d < M ? d : M - 1

            // iterate until one of the indics goes out of scope
            // Take note of the index math to go down the diagonal
            while r < N && c > -1 {
                intermediate.append(matrix[r][c])
                r = r + 1
                c = c - 1
            }

            //Reverse even numbered diagonals. The
            // atricle says we have to reverse odd
            // numbered articles but here, the numbering
            // is starting from 0

            if d % 2 == 0 {
                intermediate.reverse()
            }

            for i in 0..<intermediate.count {
                result[k] = intermediate[i]
                k = k + 1
            }
        }
        return result
    }


    func spiralOrder(_ matrix: [[Int] ]) -> [Int] {

        var ans: [Int] = []
        guard !matrix.isEmpty else { return ans }

        let R = matrix.count
        let C = matrix.first!.count

        var seen: [[Bool]] = Array(repeating: Array(repeating: false, count: R), count: C)



        let dr = [0, 1, 0, -1]

        let dc = [1, 0, -1, 0]


        // R = row
        // C = column
        // di = forward direction
        var r = 0, c = 0, di = 0
        for _ in 0..<(R * C) {

            ans.append(matrix[r][c])
            seen[r][c] = true
            let cr = r + dr[di]
            let cc = c + dc[di]
            if (0 <= cr && cr < R && 0 <= cc && cc < C && !seen[cr][cc]) {
                r = cr
                c = cc
            } else {
                di = (di + 1) % 4
                r += dr[di]
                c += dc[di]
            }
        }

        return ans


    }


    func arrayPairSum(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()

        var result = 0

        for index in stride(from: 0, to: sortedNums.count, by: 2) {
            result = result + sortedNums[index]
        }


        return result

    }

    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        guard numbers.count > 0 else  {return []}

        var i = 0, j = numbers.count - 1

        while (i < j) {
            let sum = numbers[i] + numbers[j];
            if (sum == target) {
                return [i + 1, j + 1]
            } else if (sum < target) {
                i += 1
            } else {
                j -= 1
            }
        }
        return []
    }


    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slowPointer = 0
        for fastPointer in 0..<nums.count {
            if nums[fastPointer] != val {
                nums.swapAt(slowPointer, fastPointer)
                slowPointer += 1
            }
        }
        return slowPointer
    }

    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {

        var i = 0
        var currentMaxNumber = 0
        for j in 0..<nums.count {
          if nums[j] == 0 {
              let tempNumber =  j - i - 1
              currentMaxNumber = tempNumber > currentMaxNumber ? tempNumber : currentMaxNumber
              i = j
          }
        }

        return currentMaxNumber

    }

       func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
          let sortedNums = Array(nums.sorted().reversed())
           var counter = 0
           var remainNumber = s

              for i in 0..<sortedNums.count {
               if remainNumber <= 0  {  break }
               if sortedNums[i] <= remainNumber {
                   counter += 1
                   remainNumber = remainNumber - sortedNums[i]
               }
           }

           if counter == 0 {
               return 0
           }

           return remainNumber == 0 ? counter : 0
       }

    func reverseWords(_ s: String) -> String {
        let sArray = s.split(separator: " ")

        var result: [String] = []
        for subString in sArray {
            result.append(String(subString.reversed()))
        }

        return result.joined(separator: " ")
    }

}


