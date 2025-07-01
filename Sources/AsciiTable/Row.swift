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
