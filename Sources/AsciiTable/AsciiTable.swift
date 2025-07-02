//
//  AsciiTable.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//

public class AsciiTable {
    private var rows: [Row]
    private let headerDividerStyle: HeaderDivider
    private let style: Style
    
    public init(labels: RowValues,
                headerDivider: HeaderDivider = .double,
                style styleName: StyleName = .popular) {
        self.rows = labels.isEmpty ? [] : {
            [.row(labels.cells), {
                switch headerDivider {
                case .single:   .divider
                case .double:   .doubleDivider
                }
            }()]
        }()
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
        let columnAmount = rows.map { $0.count }.max() ?? 1
        
        var topBorder = ""
        var divider = "\n"
        var doubleDivider = "\n"
        var bottomBorder = "\n"
        
        topBorder.append(style[.topLeft])
        bottomBorder.append(style[.bottomLeft])
        divider.append(style[.dividerLeft])
        doubleDivider.append(style[.doubleDividerLeft])
        var columnWidth: [Int] = []
        for column in 0..<columnAmount {
            let isLast = column == columnAmount - 1
            let maxWidth = rows.map { $0.width(for: column) }.max() ?? 1
            columnWidth.append(maxWidth)
            let width = maxWidth + 3
            topBorder.append(String(repeating: style[.top], count: width))
            topBorder.append(isLast ? style[.topRight] : style[.topCross])
            
            bottomBorder.append(String(repeating: style[.bottom], count: width))
            bottomBorder.append(isLast ? style[.bottomRight] : style[.bottomCross])
            
            divider.append(String(repeating: style[.divider], count: width))
            divider.append(isLast ? style[.dividerRight] : style[.dividerCross])
            
            doubleDivider.append(String(repeating: style[.doubleDivider], count: width))
            doubleDivider.append(isLast ? style[.doubleDividerRight] : style[.doubleDividerCross])
        }
        output.append(topBorder)
        
        for row in rows {
            switch row {
            case .row:
                output.append("\n\(style[.outerWall]) ")
                for index in (0..<columnAmount) {
                    let isLast = index == columnAmount - 1
                    let text = row[safeIndex: index]?.content ?? ""
                    output.append(" \(text)")
                    output.append(String(repeating: " ", count: columnWidth[index] - text.count + 2))
                    output.append(isLast ? style[.outerWall] : style[.innerWall])
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
