//
//  212-Word Search 2.swift
//  Lee
//
//  Created by Matthew Lu on 31/8/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

import Foundation


fileprivate class TrieNode {
    var children: [Character: TrieNode] =  [:]
    var word: String?
}

class Solution_212 {


    var _board:[[Character]]? = nil

    var _result: [String] = []

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {

        // Step 1. construct the trie
        let root = TrieNode()
        for word in words {
            var node = root

            for letter in word {
                if node.children.keys.contains(letter) {
                    node = node.children[letter]!
                } else {
                    let newNode = TrieNode()
                    node.children[letter] = newNode
                    node = newNode
                }
            }
            node.word = word // store words in Trie
        }


        _board = board

        // step 2, backtracking starting for each cell in the board
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if root.children.keys.contains(board[row][col]) {
                    backtracking(row, col, root)
                }
            }
        }
        return _result
    }

    private func backtracking(_ row: Int, _ col: Int, _ parent: TrieNode) {
        let letter = _board![row][col]
        let currNode = parent.children[letter]!

        // check if there is any match
        if currNode.word != nil {
            _result.append(currNode.word!)
            currNode.word = nil
        }

        // mark the current letter before the EXPLORATION
        _board![row][col] = "#"

        // explore neighbor cells in around-clock directions: up, right, down,left

        let rowOffset = [-1, 0, 1, 0]
        let colOffset = [0, 1, 0, -1]

        for i in 0..<4 {
            let newRow = row + rowOffset[i]
            let newCol = col + colOffset[i]

            if newRow < 0 || newRow >= _board!.count || newCol < 0 || newCol >= _board![0].count {
                continue
            }

            if currNode.children.keys.contains(_board![newRow][newCol]) {
                backtracking(newRow, newCol, currNode)
            }
        }

        //End of EXPLORATION, restore the original letter in the board
        _board![row][col] = letter

        // Optimization: incrementally remove the leaf nodes
        if currNode.children.isEmpty {
            parent.children.removeValue(forKey: letter)
        }
    }
}
