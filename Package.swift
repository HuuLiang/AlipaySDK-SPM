// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlipaySDK",
    products: [
        .library(
            name: "AlipaySDK",
            targets: ["AlipaySDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AlipaySDKBinary",
            path: "Frameworks/AlipaySDK.xcframework"
        ),
        .target(
            name: "AlipaySDK",
            dependencies: [
                "AlipaySDKBinary"
            ],
            resources: [
                .copy("Resources/AlipaySDK.bundle")
            ],
            linkerSettings: [
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreText"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreMotion"),
                .linkedLibrary("c++"),
                .linkedLibrary("z")
            ]
        ),
        .testTarget(
            name: "AlipaySDKTests",
            dependencies: ["AlipaySDK"]
        ),
    ]
)
