// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusMintegralAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusMintegralAdapter",
            targets: ["TradPlusMintegralAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/Mintegral-official/MintegralAdSDK-Swift-Package.git",
            .exact("8.1.7")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusMintegralAdapter",
            dependencies: [
                .target(name: "TPMintegralAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "MintegralAdSDK", package: "MintegralAdSDK-Swift-Package"),
            ],
            path: ".",
            sources: ["Sources/TradPlusMintegralAdapter/TradPlusMintegralAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPMintegralAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Mintegral/releases/download/15.15.0/TPMintegralAdapter-15.15.0.xcframework.zip",
            checksum: "70cabb71b7a3f9dbea54fa7f904f00948624d099c3df039139e63059cf33ef8e"
        ),
    ]
)
