//
//  AsciiTable.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//

public class Row {
    var data: [CustomStringConvertible]
    
    public init(_ data: [CustomStringConvertible]) {
        self.data = data
    }

    func size(for index: Int) -> Int {
        data[safeIndex: index]?.description.count ?? 0
    }
}

public class AsciiTable {
    let labels: Row
    var rows: [Row]
    
    public init(labels: [CustomStringConvertible], rows: [Row] = []) {
        self.labels = Row(labels)
        self.rows = rows
    }
    
    @discardableResult
    public func add(row: Row) -> AsciiTable {
        self.rows.append(row)
        return self
    }
    
    @discardableResult
    public func add(row data: [CustomStringConvertible]) -> AsciiTable {
        self.rows.append(Row(data))
        return self
    }
    
    public var output: String {
        var output = ""
        
        let columnAmount = max(rows.map { $0.data.count }.max() ?? 1, labels.data.count)

        var topBorder = ""
        var middleDivider = "\n"
        var bottomBorder = "\n"
        
        topBorder.append("╒═")
        bottomBorder.append("└─")
        middleDivider.append("├─")
        var columnWidth: [Int] = []
        for column in (0..<columnAmount) {
            let maxWidthFromRows = rows.map { $0.size(for: column) }.max() ?? 1
            let maxWidth = max(maxWidthFromRows, labels.data[safeIndex: column]?.description.count ?? 1)
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
        if !labels.data.isEmpty {
            output.append("\n│ ")
            for index in (0..<columnAmount) {
                let label = labels.data[safeIndex: index] ?? ""
                output.append(" \(label)")
                let spacing = columnWidth[index] - label.description.count
                output.append((0...spacing).map { _ in " " }.joined())
                output.append(" │")
            }
            output.append(middleDivider)
        }
        for row in rows {
            output.append("\n│ ")
            for index in (0..<columnAmount) {
                let data = row.data[safeIndex: index] ?? ""
                output.append(" \(data)")
                let spacing = columnWidth[index] - data.description.count
                output.append((0...spacing).map { _ in " " }.joined())
                output.append(" │")
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
