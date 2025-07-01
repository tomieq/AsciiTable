//
//  Array+extension.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//

extension Array {
    subscript(safeIndex index: Int) -> Element? {
        get {
            guard index >= 0, index < count else { return nil }
            return self[index]
        }

        set(newValue) {
            guard let value = newValue, index >= 0, index < count else { return }
            self[index] = value
        }
    }
}
