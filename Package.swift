// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Alloy",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v11),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "Alloy",
            targets: ["Alloy"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "ShadersSharedCode",
                dependencies: [],
                path: "Alloy/Shaders/",
                exclude: [],
                sources: ["ShaderStructures.h"],
                resources: nil,
                publicHeadersPath: nil,
                cSettings: nil,
                cxxSettings: nil,
                swiftSettings: nil,
                linkerSettings: nil),
        .target(name: "Alloy",
                dependencies: [.target(name: "ShadersSharedCode")],
                path: "Alloy",
                exclude: [],//["Renderers"],
                sources: nil,
                resources: [.process("Shaders/Shaders.metal")],
                publicHeadersPath: nil,
                cSettings: nil,
                cxxSettings: nil,
                swiftSettings: nil,
                linkerSettings: [
                    .linkedFramework("Metal"),
                    .linkedFramework("CoreVideo"),
                    .linkedFramework("MetalPerformanceShaders"),
                    .linkedFramework("CoreGraphics")
                ])
    ]
)