//
//  BinarySearchTree.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 27.04.2022.
//

import Foundation

class BinaryNodeOfString {
    var value: String
    fileprivate(set) var leftChild: BinaryNodeOfString?
    fileprivate(set) var rightChild: BinaryNodeOfString?
    
    init(_ value: String) {
        self.value = value
    }
        
    func insert(_ node: BinaryNodeOfString) {
        if node.value == value {
            print("The tree already contains a node with this value")
            return
        }
        if node.value > value {
            if rightChild == nil {
                rightChild = node
            } else {
                rightChild?.insert(node)
            }
        } else {
            if leftChild == nil {
                leftChild = node
            } else {
                leftChild?.insert(node)
            }
        }
    }
    
    func insert(_ nodes: [BinaryNodeOfString]) {
        nodes.forEach { insert($0)}
    }
    
    func find(_ value: String) -> BinaryNodeOfString? {
        var node: BinaryNodeOfString?
        
        if value == self.value {
            node = self
        } else {
            if value > self.value {
                if rightChild != nil {
                    node = rightChild?.find(value)
                } else {
                    return nil
                }
            } else {
                if leftChild != nil {
                    node = leftChild?.find(value)
                } else {
                    return nil
                }
            }
        }
        return node
    }
}

extension BinaryNodeOfString: CustomStringConvertible {
    var description: String {
        if leftChild != nil && rightChild != nil {
            return (leftChild?.value ?? "") + "<-" + value + "->" + (rightChild?.value ?? "")
        } else if leftChild != nil && rightChild == nil {
            return (leftChild?.value ?? "") + "<-" + value
        } else if leftChild == nil && rightChild != nil {
            return value + "->" + (rightChild?.value ?? "")
        } else {
            return value
        }
    }
}
