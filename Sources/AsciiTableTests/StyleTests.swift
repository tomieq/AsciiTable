//
//  StyleTests.swift
//  AsciiTable
//
//  Created by Tomasz Kucharski on 02/07/2025.
//

import Testing
import AsciiTable

struct StyleTests {
    @Test
    func singleDividerPopular() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .single,
                               style: .popular)
        fill(table)
        let expected = """
        ╒═════════════╤═══════════╤═════════╤═════════╕
        │  Type       │ Maker     │         │ wheels  │
        ├─────────────┼───────────┼─────────┼─────────┤
        │  car        │ Toyota    │ hybrid  │ 4       │
        ├─────────────┼───────────┼─────────┼─────────┤
        │  motorbike  │ Suzuki    │         │ 2       │
        │  car        │ Audi      │ petrol  │ 4       │
        ╞═════════════╪═══════════╪═════════╪═════════╡
        │  car        │ Mercedes  │ diesel  │ 4       │
        └─────────────┴───────────┴─────────┴─────────┘
        """
        #expect(table.output == expected)
    }
    @Test
    func doubleDividerPopular() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .double,
                               style: .popular)
        fill(table)
        let expected = """
        ╒═════════════╤═══════════╤═════════╤═════════╕
        │  Type       │ Maker     │         │ wheels  │
        ╞═════════════╪═══════════╪═════════╪═════════╡
        │  car        │ Toyota    │ hybrid  │ 4       │
        ├─────────────┼───────────┼─────────┼─────────┤
        │  motorbike  │ Suzuki    │         │ 2       │
        │  car        │ Audi      │ petrol  │ 4       │
        ╞═════════════╪═══════════╪═════════╪═════════╡
        │  car        │ Mercedes  │ diesel  │ 4       │
        └─────────────┴───────────┴─────────┴─────────┘
        """
        #expect(table.output == expected)
    }
    @Test
    func singleDividerSingleBorder() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .single,
                               style: .singleBorder)
        fill(table)
        let expected = """
        ┌─────────────┬───────────┬─────────┬─────────┐
        │  Type       │ Maker     │         │ wheels  │
        ├─────────────┼───────────┼─────────┼─────────┤
        │  car        │ Toyota    │ hybrid  │ 4       │
        ├─────────────┼───────────┼─────────┼─────────┤
        │  motorbike  │ Suzuki    │         │ 2       │
        │  car        │ Audi      │ petrol  │ 4       │
        ╞═════════════╪═══════════╪═════════╪═════════╡
        │  car        │ Mercedes  │ diesel  │ 4       │
        └─────────────┴───────────┴─────────┴─────────┘
        """
        #expect(table.output == expected)
    }
    @Test
    func doubleDividerSingleBorder() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .double,
                               style: .singleBorder)
        fill(table)
        let expected = """
        ┌─────────────┬───────────┬─────────┬─────────┐
        │  Type       │ Maker     │         │ wheels  │
        ╞═════════════╪═══════════╪═════════╪═════════╡
        │  car        │ Toyota    │ hybrid  │ 4       │
        ├─────────────┼───────────┼─────────┼─────────┤
        │  motorbike  │ Suzuki    │         │ 2       │
        │  car        │ Audi      │ petrol  │ 4       │
        ╞═════════════╪═══════════╪═════════╪═════════╡
        │  car        │ Mercedes  │ diesel  │ 4       │
        └─────────────┴───────────┴─────────┴─────────┘
        """
        #expect(table.output == expected)
    }
    @Test
    func singleDividerDoubleBorder() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .single,
                               style: .doubleBorder)
        fill(table)
        let expected = """
        ╔═════════════╤═══════════╤═════════╤═════════╗
        ║  Type       │ Maker     │         │ wheels  ║
        ╟─────────────┼───────────┼─────────┼─────────╢
        ║  car        │ Toyota    │ hybrid  │ 4       ║
        ╟─────────────┼───────────┼─────────┼─────────╢
        ║  motorbike  │ Suzuki    │         │ 2       ║
        ║  car        │ Audi      │ petrol  │ 4       ║
        ╠═════════════╪═══════════╪═════════╪═════════╣
        ║  car        │ Mercedes  │ diesel  │ 4       ║
        ╚═════════════╧═══════════╧═════════╧═════════╝
        """
        print(table)
        #expect(table.output == expected)
    }
    @Test
    func doubleDividerDoubleBorder() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .double,
                               style: .doubleBorder)
        fill(table)
        let expected = """
        ╔═════════════╤═══════════╤═════════╤═════════╗
        ║  Type       │ Maker     │         │ wheels  ║
        ╠═════════════╪═══════════╪═════════╪═════════╣
        ║  car        │ Toyota    │ hybrid  │ 4       ║
        ╟─────────────┼───────────┼─────────┼─────────╢
        ║  motorbike  │ Suzuki    │         │ 2       ║
        ║  car        │ Audi      │ petrol  │ 4       ║
        ╠═════════════╪═══════════╪═════════╪═════════╣
        ║  car        │ Mercedes  │ diesel  │ 4       ║
        ╚═════════════╧═══════════╧═════════╧═════════╝
        """
        #expect(table.output == expected)
    }
    @Test
    func singleDividerNoBorder() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .single,
                               style: .noBorder)
        fill(table)
        let expected = """
                                                       
           Type       │ Maker     │         │ wheels   
         ─────────────┼───────────┼─────────┼───────── 
           car        │ Toyota    │ hybrid  │ 4        
         ─────────────┼───────────┼─────────┼───────── 
           motorbike  │ Suzuki    │         │ 2        
           car        │ Audi      │ petrol  │ 4        
         ═════════════╪═══════════╪═════════╪═════════ 
           car        │ Mercedes  │ diesel  │ 4        
                                                       
        """
        #expect(table.output == expected)
    }
    @Test
    func doubleDividerNoBorder() {
        let table = AsciiTable(labels: labels,
                               headerDivider: .double,
                               style: .noBorder)
        fill(table)
        let expected = """
                                                       
           Type       │ Maker     │         │ wheels   
         ═════════════╪═══════════╪═════════╪═════════ 
           car        │ Toyota    │ hybrid  │ 4        
         ─────────────┼───────────┼─────────┼───────── 
           motorbike  │ Suzuki    │         │ 2        
           car        │ Audi      │ petrol  │ 4        
         ═════════════╪═══════════╪═════════╪═════════ 
           car        │ Mercedes  │ diesel  │ 4        
                                                       
        """
        #expect(table.output == expected)
    }
    private let labels: RowValues = ["Type", "Maker", "", "wheels"]
    private func fill(_ table: AsciiTable) {
        table.add(["car", "Toyota", "hybrid", "4"])
        table.addDivider()
        table.add(["motorbike", "Suzuki", nil, "2"])
        table.add(["car", "Audi", "petrol", "4"])
        table.addDoubleDivider()
        table.add(["car", "Mercedes", "diesel", "4"])
    }
}
