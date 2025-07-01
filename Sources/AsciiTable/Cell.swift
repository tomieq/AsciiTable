//
//  Cell.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//
import Foundation

struct Cell {
    let content: String
    
    var height: Int {
        lines.count
    }
    
    var width: Int {
        lines.map { $0.count }.max() ?? 0
    }
    
    var lines: [String] {
        content.components(separatedBy: .newlines)
    }
}

extension Cell {
    func extracted(line: Int) -> Cell {
        Cell(content: lines[safeIndex: line] ?? "")
    }
}
