//
//  StyleFactory.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 02/07/2025.
//

enum StyleFactory {
    static func style(_ name: StyleName) -> Style {
        switch name {
        case .popular:
            PopularStyle()
        case .singleBorder:
            SingleBorder()
        case .doubleBorder:
            DoubleBorder()
        case .noBorder:
            NoBorder()
        }
    }
}
