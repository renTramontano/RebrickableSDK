// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RebrickableSDK",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "RebrickableSDK",
            targets: ["RebrickableSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/httpswift/swifter.git", .upToNextMajor(from: "1.5.0"))
    ],
    targets: [
        .target(
            name: "RebrickableSDK",
            dependencies: [],
            exclude: ["Info.plist"]),
        .testTarget(
            name: "RebrickableSDKTests",
            dependencies: [
                "RebrickableSDK",
                .product(name: "Swifter", package: "swifter")
            ],
            exclude: ["Info.plist"]),
    ]
)
