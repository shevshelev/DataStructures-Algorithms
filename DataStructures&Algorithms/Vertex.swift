//
//  Vertex.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 27.04.2022.
//

import Foundation

struct Vertex<T> {
    let index: Int
    let data: T
}

extension Vertex: CustomStringConvertible {
    var description: String {
        "\(index): \(data)"
    }
}

extension Vertex: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher = Hasher()
    }
}

extension Vertex: Equatable {
    static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.index == rhs.index
    }
}
