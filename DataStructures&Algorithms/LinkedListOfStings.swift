//
//  LinkedListOfStings.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 26.04.2022.
//


struct LinkedListOfStings {
    private(set) var firstNode: Node?
    private(set) var lastNode: Node?
}


final class Node {
    var value: String
    fileprivate(set) weak var previous: Node?
    fileprivate(set) var next: Node?
    
    init(value: String) {
        self.value = value
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.next?.value == rhs.next?.value
        && lhs.value == rhs.value
        && lhs.previous?.value == rhs.previous?.value
    }
    
    
}

extension LinkedListOfStings {
    mutating func append(_ node: Node) {
        node.previous = lastNode
        lastNode?.next = node
        lastNode = node
        if firstNode == nil {
            firstNode = node
        }
    }
    
    mutating func addNodes(_ nodes: [Node]) {
        nodes.forEach { append($0)}
    }
}

extension LinkedListOfStings {
    func findNode(_ value: String) -> Node? {
        var currentNode = firstNode
        while currentNode?.value != value {
            if currentNode == lastNode {
                currentNode = nil
                break
            }
            currentNode = currentNode?.next
        }
        return currentNode
    }
}
