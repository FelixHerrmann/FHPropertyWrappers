// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FHPropertyWrappers",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "FHPropertyWrappers",
            targets: ["FHPropertyWrappers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FHPropertyWrappers",
            dependencies: []),
        .testTarget(
            name: "FHPropertyWrappersTests",
            dependencies: ["FHPropertyWrappers"]),
    ]
)
