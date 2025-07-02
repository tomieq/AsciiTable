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
    func popularSingleDivider() {
        let table = AsciiTable(labels: labels,
                               style: .popular,
                               headerDivider: .single)
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
    func popularDoubleDivider() {
        let table = AsciiTable(labels: labels, style: .popular, headerDivider: .double)
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
    func singleBorderSingleDivider() {
        let table = AsciiTable(labels: labels, style: .singleBorder, headerDivider: .single)
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
    func singleBorderDoubleDivider() {
        let table = AsciiTable(labels: labels, style: .singleBorder, headerDivider: .double)
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
    func doubleBorderSingleDivider() {
        let table = AsciiTable(labels: labels, style: .doubleBorder, headerDivider: .single)
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
        #expect(table.output == expected)
    }
    @Test
    func doubleBorderDoubleDivider() {
        let table = AsciiTable(labels: labels, style: .doubleBorder, headerDivider: .double)
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
    func noBorderSingleDivider() {
        let table = AsciiTable(labels: labels, style: .noBorder, headerDivider: .single)
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
    func noBorderDoubleDivider() {
        let table = AsciiTable(labels: labels, style: .noBorder, headerDivider: .double)
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
