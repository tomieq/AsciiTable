//
//  AsciiTableTests.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 01/07/2025.
//

import Testing
import AsciiTable

struct AsciiTableTests {
    @Test
    func regularTable() {
        let table = AsciiTable(labels: ["A", "BB"])
        table.add(row: ["cccccc", "d"])
        table.add(row: ["", "ffffffffffff"])
        let expected = """
        ╒══════════╤═══════════════╕
        │  A       │ BB            │
        ├──────────┼───────────────┤
        │  cccccc  │ d             │
        │          │ ffffffffffff  │
        └──────────┴───────────────┘
        """
        #expect(table.output == expected)
    }

    @Test
    func tableWithoutLabels() {
        let table = AsciiTable(labels: [])
        table.add(row: ["cccccc", "d"])
        table.add(row: ["", "ffffffffffff"])
        let expected = """
        ╒══════════╤═══════════════╕
        │  cccccc  │ d             │
        │          │ ffffffffffff  │
        └──────────┴───────────────┘
        """
        #expect(table.output == expected)
    }
    @Test
    func tableWithExtraDivider() {
        let table = AsciiTable(labels: ["A", "BB"])
        table.add(row: ["cccccc", "d"])
        table.addDivider()
        table.add(row: ["", "ffffffffffff"])
        let expected = """
        ╒══════════╤═══════════════╕
        │  A       │ BB            │
        ├──────────┼───────────────┤
        │  cccccc  │ d             │
        ├──────────┼───────────────┤
        │          │ ffffffffffff  │
        └──────────┴───────────────┘
        """
        #expect(table.output == expected)
    }
    @Test
    func tableNoLabelsWithExtraDivider() {
        let table = AsciiTable(labels: [])
        table.add(row: ["cccccc", "d"])
        table.addDivider()
        table.add(row: ["", "ffffffffffff"])
        let expected = """
        ╒══════════╤═══════════════╕
        │  cccccc  │ d             │
        ├──────────┼───────────────┤
        │          │ ffffffffffff  │
        └──────────┴───────────────┘
        """
        #expect(table.output == expected)
    }
}
