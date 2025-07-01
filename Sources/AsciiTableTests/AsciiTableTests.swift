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
        table.add(["cccccc", "d"])
        table.add(["", "ffffffffffff"])
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
        table.add(["cccccc", "d"])
        table.add(["", "ffffffffffff"])
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
        table.add(["cccccc", "d"])
        table.addDivider()
        table.add(["", "ffffffffffff"])
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
        table.add(["cccccc", "d"])
        table.addDivider()
        table.add(.row(["", "ffffffffffff"]))
        let expected = """
        ╒══════════╤═══════════════╕
        │  cccccc  │ d             │
        ├──────────┼───────────────┤
        │          │ ffffffffffff  │
        └──────────┴───────────────┘
        """
        #expect(table.output == expected)
    }
    
    @Test
    func tableWithNilLabel() {
        let table = AsciiTable(labels: [nil, "BB"])
        table.add(["cccccc", "d"])
        table.add(["", "ffffffffffff"])
        let expected = """
        ╒══════════╤═══════════════╕
        │          │ BB            │
        ├──────────┼───────────────┤
        │  cccccc  │ d             │
        │          │ ffffffffffff  │
        └──────────┴───────────────┘
        """
        #expect(table.output == expected)
    }

    @Test
    func tableWithNilValue() {
        let table = AsciiTable(labels: ["A", "BB"])
        table.add(["cccccc", "d"])
        table.add([nil, "ffffffffffff"])
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
    func ss() {
        let table = AsciiTable(labels: ["endpoint", "method", "content-type"])
        table.add(["/warhouse", "POST", "application/json"])
        table.add(["/shop", "GET", "text/html"])
        table.add(["/order", "POST", "application/json"])
        table.add(["/admin/auth/v1/token", "GET", "application/json"])
        print(table)
    }
}
