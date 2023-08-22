//
//  208-Implement Trie (Prefix Tree).swift
//  Lee
//
//  Created by Matthew Lu on 25/8/20.
//  Copyright © 2020 Matthew Lu. All rights reserved.
//

import Foundation

/*

 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:

 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.

 链接：https://leetcode-cn.com/problems/implement-trie-prefix-tree
 */

class Trie {

    private var root: TrieNode

    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {

        var node = root

          for char in word {
            if !node.containsKey(char) {
                node.put(char, TrieNode())
            }

            if let existingNode = node.get(char) {
                node = existingNode
            }
        }
        node.setEnd()
    }

    // search a prefix or whole key in trie and
    // returns the node where search ends
    private func searchPrefix(_ word: String) -> TrieNode? {
        var node = root

        for char in word {
            if node.containsKey(char) {
                node = node.get(char)!
            } else {
                return nil
            }
        }
        return node
    }


    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node != nil && node!.isEnd()
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        let node = searchPrefix(prefix)

        return node != nil
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */



private class TrieNode {

    private var links: [TrieNode?]

    private let R = 26

    private var isend: Bool = false


    let a_asciiValue = Int(Character("a").asciiValue ?? 97)
    init() {
        links = [TrieNode?](repeating:nil, count:R)
    }

    public func containsKey(_ ch: Character) -> Bool {
        guard let asciiValue = ch.asciiValue else {
            return false
        }

        let charAt = Int(asciiValue) - a_asciiValue
        return links[charAt] != nil
    }

    public func get(_ ch: Character) -> TrieNode? {
        guard let asciiValue = ch.asciiValue else { return nil }

        let charAt = Int(asciiValue) - a_asciiValue

        return links[charAt]
    }

    public func put(_ ch: Character, _ node: TrieNode) {
        guard let asciiValue = ch.asciiValue else { return }
        let charAt = Int(asciiValue) - a_asciiValue
        links[charAt] = node
    }

    public func setEnd() {
        self.isend = true
    }

    public func isEnd() -> Bool {
        return self.isend
    }


}
