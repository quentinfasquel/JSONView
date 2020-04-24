// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSONView",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "JSONView", targets: ["JSONView"]),
    ],
    targets: [
        .target(name: "JSONView", dependencies: []),
        .testTarget( name: "JSONViewTests", dependencies: ["JSONView"]),
    ]
)
