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
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/Mintegral-official/MintegralAdSDK-Swift-Package.git",
            .exact("8.1.5")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Mintegral/releases/download/15.14.0/TPMintegralAdapter-15.14.0.xcframework.zip",
            checksum: "e9053174dd8da848e0ab44440a6407d08bdd1f8d81ff7fecafe2cfa432e53c33"
        ),
    ]
)
