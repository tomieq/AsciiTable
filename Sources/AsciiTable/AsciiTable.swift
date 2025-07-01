//
//  AsciiTable.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//




public class AsciiTable {
    let labels: Row
    var rows: [Row]
    
    public init(labels: RowValues) {
        self.labels = .row(labels.cells)
        self.rows = []
    }
    
    @discardableResult
    public func add(_ values: RowValues) -> AsciiTable {
        self.rows.append(.row(values.cells))
        return self
    }
    
    @discardableResult
    public func addDivider() -> AsciiTable {
        self.rows.append(.divider)
        return self
    }
    
    public var output: String {
        var output = ""
        
        let rows = rows.flatMap { MultilineAdjuster.adjust($0) }
        let columnAmount = max(rows.map { $0.count }.max() ?? 1, labels.count)
        
        var topBorder = ""
        var middleDivider = "\n"
        var bottomBorder = "\n"
        
        topBorder.append("╒═")
        bottomBorder.append("└─")
        middleDivider.append("├─")
        var columnWidth: [Int] = []
        for column in (0..<columnAmount) {
            let maxWidthFromRows = rows.map { $0.width(for: column) }.max() ?? 1
            let maxWidth = max(maxWidthFromRows, labels[safeIndex: column]?.content.count ?? 1)
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
            let labelsAdjusted = MultilineAdjuster.adjust(labels)
            for labels in labelsAdjusted {
                output.append("\n│ ")
                for index in (0..<columnAmount) {
                    let cell = labels[safeIndex: index]
                    let text = cell?.content ?? ""
                    output.append(" \(text)")
                    let spacing = columnWidth[index] - text.count
                    output.append((0...spacing).map { _ in " " }.joined())
                    output.append(" │")
                }
            }
            output.append(middleDivider)
        }
        for row in rows {
            switch row {
            case .row:
                output.append("\n│ ")
                for index in (0..<columnAmount) {
                    let cell = row[safeIndex: index]
                    let text = cell?.content ?? ""
                    output.append(" \(text)")
                    let spacing = columnWidth[index] - text.count
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

extension Row {
    var count: Int {
        switch self {
        case .row(let cells):
            cells.count
        case .divider:
            0
        }
    }
    func width(for index: Int) -> Int {
        switch self {
        case .row(let cells):
            cells[safeIndex: index]?.width ?? 0
        case .divider:
            0
        }
    }
    
    subscript(safeIndex index: Int) -> Cell? {
        switch self {
        case .row(let cells):
            cells[safeIndex: index] ?? nil
        case .divider:
            nil
        }
    }
}
