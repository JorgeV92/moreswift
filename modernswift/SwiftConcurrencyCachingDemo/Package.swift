// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftConcurrencyCachingDemo",
    products: [
        .executable(
            name: "swift-concurrency-demo",
            targets: ["SwiftConcurrencyCachingDemo"]
        )
    ],
    targets: [
        .executableTarget(
            name: "SwiftConcurrencyCachingDemo",
            dependencies: []
        )
    ]
)
