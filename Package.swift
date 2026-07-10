// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlipaySDk",
    products: [
        .library(
            name: "AlipaySDk",
            targets: ["AlipaySDk"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AlipaySDkBinary",
            path: "Frameworks/AlipaySDk.xcframework"
        ),
        .target(
            name: "AlipaySDk",
            dependencies: [
                "AlipaySDkBinary"
            ],
            resources: [
                .copy("AlipaySDK.bundle")
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
            name: "AlipaySDkTests",
            dependencies: ["AlipaySDk"]
        ),
    ]
)
