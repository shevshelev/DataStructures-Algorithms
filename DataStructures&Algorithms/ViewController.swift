//
//  ViewController.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testLinkedList()
        testBST()
        testGraph()
        testSort()
    }
    
    private func testLinkedList() {
        var list = LinkedListOfStings()
        let node1 = Node(value: "A")
        let node2 = Node(value: "B")
        let node3 = Node(value: "C")
        let node4 = Node(value: "D")
        let node5 = Node(value: "E")
        list.addNodes([node1, node2, node3, node4, node5])
        let find = list.findNode("F")
        print(#function)
        if let previous = find?.previous?.value {
            print("Previous: \(previous)")
        }
        if let find = find {
            print(find.value)
        } else {
            print("Not found")
        }
        if let next = find?.next?.value {
            print("Next: \(next)")
        }
    }
    
    private func testBST() {
        let tree = BinaryNodeOfString("ABC")
        let node1 = BinaryNodeOfString("DEF")
        let node2 = BinaryNodeOfString("AAB")
        let node3 = BinaryNodeOfString("AAA")
        let node4 = BinaryNodeOfString("GHI")
        let node5 = BinaryNodeOfString("GAB")
        tree.insert([node1, node2, node3, node4, node5])
        let find = tree.find("DEF")
        print(#function)
        if let find = find {
            print(find)
        } else {
            print("Not found")
        }
    }
    
    private func testGraph() {
        let metroNSK = AdjacencyList<String>()

        let zelcovskaya = metroNSK.createVertex(data: "Зельцовская")
        let gagarinskaya = metroNSK.createVertex(data: "Гагаринская")
        let krasniyProspect = metroNSK.createVertex(data: "Красный Проспект")
        let ploshadLenina = metroNSK.createVertex(data: "Площадь Ленина")
        let oktyabrskaya = metroNSK.createVertex(data: "Октябрьская")
        let rechnoyVokzal = metroNSK.createVertex(data: "Речной вокзал")
        let studencheskaya = metroNSK.createVertex(data: "Студенческая")
        let ploshadMarksa = metroNSK.createVertex(data: "Площадь Маркса")

        let ploshadGarinaMihaylovskogo = metroNSK.createVertex(data: "Площадь Гарина-Михайловского")
        let sibirskaya = metroNSK.createVertex(data: "Сибирская")
        let marshalaPokrishkina = metroNSK.createVertex(data: "Маршала Покрышкина")
        let berezovayaRosha = metroNSK.createVertex(data: "Березовая роща")
        let zolotayaNiva = metroNSK.createVertex(data: "Золотая нива")

        metroNSK.add(.undirected, from: zelcovskaya, to: gagarinskaya, weight: 7)
        metroNSK.add(.undirected, from: gagarinskaya, to: krasniyProspect, weight: 5)
        metroNSK.add(.undirected, from: krasniyProspect, to: ploshadLenina, weight: 8)
        metroNSK.add(.undirected, from: ploshadLenina, to: oktyabrskaya, weight: 9)
        metroNSK.add(.undirected, from: oktyabrskaya, to: rechnoyVokzal, weight: 4)
        metroNSK.add(.undirected, from: rechnoyVokzal, to: studencheskaya, weight: 15)
        metroNSK.add(.undirected, from: studencheskaya, to: ploshadMarksa, weight: 13)
        metroNSK.add(.undirected, from: ploshadGarinaMihaylovskogo, to: sibirskaya, weight: 7)
        metroNSK.add(.undirected, from: sibirskaya, to: krasniyProspect, weight: 1)
        metroNSK.add(.undirected, from: sibirskaya, to: marshalaPokrishkina, weight: 8)
        metroNSK.add(.undirected, from: marshalaPokrishkina, to: berezovayaRosha, weight: 12)
        metroNSK.add(.undirected, from: berezovayaRosha, to: zolotayaNiva, weight: 18)

        let dijkstra = Dijkstra(graph: metroNSK)
        let pathsFrom = dijkstra.shortestPath(from: gagarinskaya)
        let path = dijkstra.shortestPath(to: zolotayaNiva, paths: pathsFrom)
        print(#function)
        for edge in path {
            print("\(edge.source) --(\(edge.weight ?? 0.0)) --> \(edge.destination)")
        }
    }
    
    private func testSort() {
        var testArray = [3, 5, 7, 8, 9, 1, 4, 2, 6]
        print("FastSort")
        print(testArray.fastSort())
        print("MergeSort")
        print(testArray.mergeSort())
    }
}

