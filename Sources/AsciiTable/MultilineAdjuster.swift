//
//  MultilineAdjuster.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//

enum MultilineAdjuster {
    static func adjust(_ row: Row) -> [Row] {
        switch row {
        case .row(let cells):
            let maxHeight = cells.map { $0.height }.max() ?? 0
            guard maxHeight > 1 else {
                return [.row(cells)]
            }
            var adjustedRows: [Row] = []
            for line in 0..<maxHeight {
                adjustedRows.append(.row(cells.map { $0.extracted(line: line) }))
            }
            return adjustedRows
        default:
            return [row]
        }
    }
}
