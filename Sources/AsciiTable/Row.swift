//
//  Row.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//

public typealias RowValues = [CustomStringConvertible?]

enum Row {
    case row([Cell])
    case divider
    case doubleDivider
}

extension Row {
    var count: Int {
        switch self {
        case .row(let cells):   cells.count
        default:                0
        }
    }
    
    func width(for index: Int) -> Int {
        switch self {
        case .row(let cells):   cells[safeIndex: index]?.width ?? 0
        default:                0
        }
    }
    
    subscript(safeIndex index: Int) -> Cell? {
        switch self {
        case .row(let cells):   cells[safeIndex: index] ?? nil
        default:                nil
        }
    }
}
