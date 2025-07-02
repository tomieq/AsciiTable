//
//  AsciiTable.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//




public class AsciiTable {
    private let labels: Row
    private var rows: [Row]
    private let headerDividerStyle: HeaderDivider
    private let style: Style
    
    public init(labels: RowValues,
                headerDivider: HeaderDivider = .double,
                style styleName: StyleName = .popular) {
        self.labels = .row(labels.cells)
        self.rows = []
        self.headerDividerStyle = headerDivider
        self.style = styleName.style
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
    
    @discardableResult
    public func addDoubleDivider() -> AsciiTable {
        self.rows.append(.doubleDivider)
        return self
    }
    
    public var output: String {
        var output = ""
        
        let rows = rows.flatMap { MultilineAdjuster.adjust($0) }
        let columnAmount = max(rows.map { $0.count }.max() ?? 1, labels.count)
        
        var topBorder = ""
        var divider = "\n"
        var doubleDivider = "\n"
        var bottomBorder = "\n"
        
        topBorder.append(style[.topLeft])
        bottomBorder.append(style[.bottomLeft])
        divider.append(style[.dividerLeft])
        doubleDivider.append(style[.doubleDividerLeft])
        var columnWidth: [Int] = []
        for column in (0..<columnAmount) {
            let maxWidthFromRows = rows.map { $0.width(for: column) }.max() ?? 1
            let maxWidth = max(maxWidthFromRows, labels[safeIndex: column]?.content.count ?? 1)
            columnWidth.append(maxWidth)
            let range = 0...(maxWidth + 2)
            topBorder.append(range.map{_ in style[.top] }.joined())
            topBorder.append(column == columnAmount - 1 ? style[.topRight] : style[.topCross])
            
            bottomBorder.append(range.map{_ in style[.bottom] }.joined())
            bottomBorder.append(column == columnAmount - 1 ? style[.bottomRight] : style[.bottomCross])
            
            divider.append(range.map{_ in style[.divider] }.joined())
            doubleDivider.append(range.map{_ in style[.doubleDivider] }.joined())
            
            divider.append(column == columnAmount - 1 ? style[.dividerRight] : style[.dividerCross])
            doubleDivider.append(column == columnAmount - 1 ? style[.doubleDividerRight] : style[.doubleDividerCross])
        }
        
        output.append(topBorder)
        if labels.count > 0 {
            let labelsAdjusted = MultilineAdjuster.adjust(labels)
            for labels in labelsAdjusted {
                output.append("\n\(style[.outerWall]) ")
                for index in (0..<columnAmount) {
                    let cell = labels[safeIndex: index]
                    let text = cell?.content ?? ""
                    output.append(" \(text)")
                    let spacing = columnWidth[index] - text.count + 1
                    output.append((0...spacing).map { _ in " " }.joined())
                    output.append(index == columnAmount - 1 ? style[.outerWall] : style[.innerWall])
                }
            }
            switch headerDividerStyle {
                
            case .single:
                output.append(divider)
            case .double:
                output.append(doubleDivider)
            }
        }
        for row in rows {
            switch row {
            case .row:
                output.append("\n\(style[.outerWall]) ")
                for index in (0..<columnAmount) {
                    let cell = row[safeIndex: index]
                    let text = cell?.content ?? ""
                    output.append(" \(text)")
                    let spacing = columnWidth[index] - text.count + 1
                    output.append((0...spacing).map { _ in " " }.joined())
                    output.append(index == columnAmount - 1 ? style[.outerWall] : style[.innerWall])
                }
            case .divider:
                output.append(divider)
            case .doubleDivider:
                output.append(doubleDivider)
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
        default:
            0
        }
    }
    func width(for index: Int) -> Int {
        switch self {
        case .row(let cells):
            cells[safeIndex: index]?.width ?? 0
        default:
            0
        }
    }
    
    subscript(safeIndex index: Int) -> Cell? {
        switch self {
        case .row(let cells):
            cells[safeIndex: index] ?? nil
        default:
            nil
        }
    }
}
