// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Camera",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Camera",
            targets: ["Camera"]),
    ],
    dependencies: [
        .package(path: "../UI")
    ],
    targets: [
        .target(
            name: "Camera",
            dependencies: ["UI"]
        ),

    ]
)
