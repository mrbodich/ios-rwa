//
//  RandomAccessCollection+Extension.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 07.05.2023.
//

import Foundation

extension RandomAccessCollection {
    func unique<ID: Hashable>(by id: KeyPath<Element, ID>) -> [Element] {
        var seen: [ID: Bool] = [:]
        return self.filter {
            seen.updateValue(true, forKey: $0[keyPath: id]) == nil
        }
    }
}
