//
//  ArrayExtension.swift
//  DataStructures&Algorithms
//
//  Created by Shevshelev Lev on 28.04.2022.
//

import Foundation

extension Array where Element: Comparable {
    mutating func fastSort() -> [Element] {
        if count < 2 {
            return self
        } else {
            var minArray: [Element] = []
            var maxArray: [Element] = []
            let supportElement = self.remove(at: count / 2)
            for element in self {
                if element > supportElement {
                    maxArray.append(element)
                } else {
                    minArray.append(element)
                }
            }
            return minArray.fastSort() + [supportElement] + maxArray.fastSort()
        }
    }
    
    private func mergeArray(_ leftArray: [Element], _ rightArray: [Element]) -> [Element] {
        var result: [Element] = []
        var leftIndex = 0
        var rightIndex = 0
        while result.count != leftArray.count + rightArray.count {
            if leftIndex == leftArray.count {
                result.append(contentsOf: Array(rightArray[rightIndex...]))
                break
            }
            if rightIndex == rightArray.count {
                result.append(contentsOf: Array(leftArray[leftIndex...]))
                break
            }
            let leftElement = leftArray[leftIndex]
            let rightElement = rightArray[rightIndex]
            
            if leftElement < rightElement {
                result.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                result.append(rightElement)
                rightIndex += 1
            } else {
                result.append(leftElement)
                leftIndex += 1
                result.append(rightElement)
                rightIndex += 1
            }
        }
        return result
    }
    
    func mergeSort() -> [Element] {
        guard count > 1 else { return self }
        let middle = count / 2
        let left = Array(self[..<middle])
        let right = Array(self[middle...])
        return mergeArray(left.mergeSort(), right.mergeSort())
    }
}
