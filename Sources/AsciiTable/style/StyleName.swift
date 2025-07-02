//
//  StyleName.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 02/07/2025.
//

public enum StyleName {
    case popular // top border is double, rest single
    case singleBorder
    case doubleBorder
    case noBorder
    
    var style: Style {
        StyleFactory.style(self)
    }
}
