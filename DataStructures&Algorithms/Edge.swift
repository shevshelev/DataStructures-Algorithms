//
//  Edge.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 27.04.2022.
//

import Foundation

enum EdgeType {
    case directed
    case undirected
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}
