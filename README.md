# AsciiTable

This is simple Swift library for formatting text tables.

## Usage
```swift
let table = AsciiTable(labels: ["endpoint", "allowed methods", "content-type"])
table.add(["/warhouse", "POST", "application/json"])
table.add(["/shop", "GET", "text/html"])
table.add(["/order", "POST", "application/json"])
table.add(["/admin/auth/v1/token", "GET", "application/json"])
print(table)
```
Output:
```
╒════════════════════════╤══════════════════╤═══════════════════╕
│  endpoint              │ allowed methods  │ content-type      │
╞════════════════════════╪══════════════════╪═══════════════════╡
│  /warhouse             │ POST             │ application/json  │
│  /shop                 │ GET              │ text/html         │
│  /order                │ POST             │ application/json  │
│  /admin/auth/v1/token  │ GET              │ application/json  │
└────────────────────────┴──────────────────┴───────────────────┘
```

## Styles

You can configure border style and header divider style.

### `StyleName.popular`
With double header divider:
```
╒════════════════════════╤══════════════════╤═══════════════════╕
│  endpoint              │ allowed methods  │ content-type      │
╞════════════════════════╪══════════════════╪═══════════════════╡
│  /warhouse             │ POST             │ application/json  │
│  /shop                 │ GET              │ text/html         │
│  /admin/auth/v1/token  │ GET              │ application/json  │
└────────────────────────┴──────────────────┴───────────────────┘
```

With single header divider:
```
╒════════════════════════╤══════════════════╤═══════════════════╕
│  endpoint              │ allowed methods  │ content-type      │
├────────────────────────┼──────────────────┼───────────────────┤
│  /warhouse             │ POST             │ application/json  │
│  /shop                 │ GET              │ text/html         │
│  /admin/auth/v1/token  │ GET              │ application/json  │
└────────────────────────┴──────────────────┴───────────────────┘
```

### `StyleName.singleBorder`
With double header divider:
```
┌────────────────────────┬──────────────────┬───────────────────┐
│  endpoint              │ allowed methods  │ content-type      │
╞════════════════════════╪══════════════════╪═══════════════════╡
│  /warhouse             │ POST             │ application/json  │
│  /shop                 │ GET              │ text/html         │
│  /admin/auth/v1/token  │ GET              │ application/json  │
└────────────────────────┴──────────────────┴───────────────────┘
```

With single header divider:
```
┌────────────────────────┬──────────────────┬───────────────────┐
│  endpoint              │ allowed methods  │ content-type      │
├────────────────────────┼──────────────────┼───────────────────┤
│  /warhouse             │ POST             │ application/json  │
│  /shop                 │ GET              │ text/html         │
│  /admin/auth/v1/token  │ GET              │ application/json  │
└────────────────────────┴──────────────────┴───────────────────┘
```

### `StyleName.doubleBorder`
With double header divider:
```
╔════════════════════════╤══════════════════╤═══════════════════╗
║  endpoint              │ allowed methods  │ content-type      ║
╠════════════════════════╪══════════════════╪═══════════════════╣
║  /warhouse             │ POST             │ application/json  ║
║  /shop                 │ GET              │ text/html         ║
║  /admin/auth/v1/token  │ GET              │ application/json  ║
╚════════════════════════╧══════════════════╧═══════════════════╝
```

With single header divider:
```
╔════════════════════════╤══════════════════╤═══════════════════╗
║  endpoint              │ allowed methods  │ content-type      ║
╟────────────────────────┼──────────────────┼───────────────────╢
║  /warhouse             │ POST             │ application/json  ║
║  /shop                 │ GET              │ text/html         ║
║  /admin/auth/v1/token  │ GET              │ application/json  ║
╚════════════════════════╧══════════════════╧═══════════════════╝
```

### `StyleName.noBorder`
With double header divider:
```
   endpoint              │ allowed methods  │ content-type       
 ════════════════════════╪══════════════════╪═══════════════════ 
   /warhouse             │ POST             │ application/json   
   /shop                 │ GET              │ text/html         
   /admin/auth/v1/token  │ GET              │ application/json   
```

With single header divider:
```
   endpoint              │ allowed methods  │ content-type       
 ────────────────────────┼──────────────────┼─────────────────── 
   /warhouse             │ POST             │ application/json   
   /shop                 │ GET              │ text/html          
   /admin/auth/v1/token  │ GET              │ application/json
```

### Dividers

You can add horizontal lines between rows with `.addDivider()` or `.addDoubleDivider()`

Sample code:
```swift
let table = AsciiTable(labels: ["endpoint", "allowed methods", "content-type"],
                       headerDivider: .double,
                       style: .popular)
table.add(["/warhouse", "POST", "application/json"])
table.addDivider()
table.add(["/shop", "GET", "text/html"])
table.addDivider()
table.add(["/admin/auth/v1/token", "GET", "application/json"])
print(table)
```

Output:
```
╒════════════════════════╤══════════════════╤═══════════════════╕
│  endpoint              │ allowed methods  │ content-type      │
╞════════════════════════╪══════════════════╪═══════════════════╡
│  /warhouse             │ POST             │ application/json  │
├────────────────────────┼──────────────────┼───────────────────┤
│  /shop                 │ GET              │ text/html         │
├────────────────────────┼──────────────────┼───────────────────┤
│  /admin/auth/v1/token  │ GET              │ application/json  │
└────────────────────────┴──────────────────┴───────────────────┘
```

## Swift Package Manager.
```swift
import PackageDescription

let package = Package(
    name: "MyServer",
    dependencies: [
        .package(url: "https://github.com/tomieq/AsciiTable", from: "2.0.0")
    ]
)
```
in the target:
```swift
    targets: [
        .executableTarget(
            name: "AppName",
            dependencies: [
                .product(name: "AsciiTable", package: "AsciiTable")
            ])
    ]
```
