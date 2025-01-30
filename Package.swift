// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "iankoex-test",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.7.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Hummingbird", package: "hummingbird"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
        ])
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableExperimentalFeature("StrictConcurrency"),
] }
