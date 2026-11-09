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
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/Mintegral-official/MintegralAdSDK-Swift-Package.git",
            .exact("8.1.8")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Mintegral/releases/download/15.18.0/TPMintegralAdapter-15.18.0.xcframework.zip",
            checksum: "0437ab7addba69b48af2d358c4edfcb95e659f40c533316da5097356ac6e78bb"
        ),
    ]
)
