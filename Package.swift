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
            .exact("15.17.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Mintegral/releases/download/15.17.0/TPMintegralAdapter-15.17.0.xcframework.zip",
            checksum: "7a6a4768ddd47b70b1c2bfbb302cf0286b56941776ea196d675f46422fe35c7c"
        ),
    ]
)
