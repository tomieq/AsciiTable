//
//  AsciiTable.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//


public typealias RowValues = [CustomStringConvertible]

public enum Row {
    case row(RowValues)
    case divider
}

public class AsciiTable {
    let labels: Row
    var rows: [Row]
    
    public init(labels: [CustomStringConvertible], rows: [Row] = []) {
        self.labels = .row(labels)
        self.rows = rows
    }
    
    @discardableResult
    public func add(row: Row) -> AsciiTable {
        self.rows.append(row)
        return self
    }
    
    @discardableResult
    public func add(row values: RowValues) -> AsciiTable {
        self.rows.append(.row(values))
        return self
    }
    
    @discardableResult
    public func addDivider() -> AsciiTable {
        self.rows.append(.divider)
        return self
    }
    
    public var output: String {
        var output = ""
        
        let columnAmount = max(rows.map { $0.count }.max() ?? 1, labels.count)

        var topBorder = ""
        var middleDivider = "\n"
        var bottomBorder = "\n"
        
        topBorder.append("╒═")
        bottomBorder.append("└─")
        middleDivider.append("├─")
        var columnWidth: [Int] = []
        for column in (0..<columnAmount) {
            let maxWidthFromRows = rows.map { $0.size(for: column) }.max() ?? 1
            let maxWidth = max(maxWidthFromRows, labels[safeIndex: column]?.description.count ?? 1)
            columnWidth.append(maxWidth)
            let range = 0...(maxWidth + 2)
            topBorder.append(range.map{_ in "═" }.joined())
            topBorder.append(column == columnAmount - 1 ? "╕" : "╤")
            
            bottomBorder.append(range.map{_ in "─" }.joined())
            bottomBorder.append(column == columnAmount - 1 ? "┘" : "┴")
            
            middleDivider.append(range.map{_ in "─" }.joined())
            middleDivider.append(column == columnAmount - 1 ? "┤" : "┼")
        }

        output.append(topBorder)
        if labels.count > 0 {
            output.append("\n│ ")
            for index in (0..<columnAmount) {
                let label = labels[safeIndex: index] ?? ""
                output.append(" \(label)")
                let spacing = columnWidth[index] - label.description.count
                output.append((0...spacing).map { _ in " " }.joined())
                output.append(" │")
            }
            output.append(middleDivider)
        }
        for row in rows {
            switch row {
            case .row(let rowValues):
                output.append("\n│ ")
                for index in (0..<columnAmount) {
                    let data = row[safeIndex: index] ?? ""
                    output.append(" \(data)")
                    let spacing = columnWidth[index] - data.description.count
                    output.append((0...spacing).map { _ in " " }.joined())
                    output.append(" │")
                }
            case .divider:
                output.append(middleDivider)
            }
            
        }
        output.append(bottomBorder)
        return output
    }
}

extension AsciiTable: CustomStringConvertible {
    public var description: String {
        output
    }
}

extension RowValues {
    func size(for index: Int) -> Int {
        self[safeIndex: index]?.description.count ?? 0
    }
}

extension Row {
    var count: Int {
        switch self {
        case .row(let rowValues):
            rowValues.count
        case .divider:
            0
        }
    }
    func size(for index: Int) -> Int {
        switch self {
        case .row(let rowValues):
            rowValues.size(for: index)
        case .divider:
            0
        }
    }
    
    subscript(safeIndex index: Int) -> CustomStringConvertible? {
        switch self {
        case .row(let rowValues):
            rowValues[safeIndex: index]
        case .divider:
            nil
        }
    }
}
