//
//  PriorityQueue.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 27.04.2022.
//

import Foundation

protocol QueueProtocol {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct PriorityQueue<Element: Equatable>: QueueProtocol {
    private var heap: Heap<Element>
    var isEmpty: Bool {
        heap.isEmpty
    }
    var peek: Element? {
        heap.peek()
    }
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    mutating func dequeue() -> Element? {
        heap.remove()
    }
}
