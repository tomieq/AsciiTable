//
//  PopularStyle.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 02/07/2025.
//

struct PopularStyle: Style {
    subscript(_ code: CharCode) -> String {
        switch code {
        case .top:
            "═"
        case .topLeft:
            "╒═"
        case .topRight:
            "╕"
        case .topCross:
            "╤"
        case .bottom:
            "─"
        case .bottomLeft:
            "└─"
        case .bottomRight:
            "┘"
        case .bottomCross:
            "┴"
        case .divider:
            "─"
        case .dividerLeft:
            "├─"
        case .dividerRight:
            "┤"
        case .dividerCross:
            "┼"
        case .doubleDivider:
            "═"
        case .doubleDividerLeft:
            "╞═"
        case .doubleDividerRight:
            "╡"
        case .doubleDividerCross:
            "╪"
        case .outerWall, .innerWall:
            "│"
        }
    }
}
