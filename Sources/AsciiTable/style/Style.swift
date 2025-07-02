//
//  Style.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 02/07/2025.
//

protocol Style {
    subscript(_ code: CharCode) -> String { get }
}
