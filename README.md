# AsciiTable

This is simple Swift library for formatting text tables.

### Usage
```swift
let table = AsciiTable(labels: ["endpoint", "method", "content-type"])
table.add(["/warhouse", "POST", "application/json"])
table.add(["/shop", "GET", "text/html"])
table.add(["/order", "POST", "application/json"])
table.add(["/admin/auth/v1/token", "GET", "application/json"])
print(table)
```
Output:
```
╒════════════════════════╤═════════╤═══════════════════╕
│  endpoint              │ method  │ content-type      │
├────────────────────────┼─────────┼───────────────────┤
│  /warhouse             │ POST    │ application/json  │
│  /shop                 │ GET     │ text/html         │
│  /order                │ POST    │ application/json  │
│  /admin/auth/v1/token  │ GET     │ application/json  │
└────────────────────────┴─────────┴───────────────────┘
```

### Swift Package Manager.
```swift
import PackageDescription

let package = Package(
    name: "MyServer",
    dependencies: [
        .package(url: "https://github.com/tomieq/AsciiTable", from: "1.0.0")
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
