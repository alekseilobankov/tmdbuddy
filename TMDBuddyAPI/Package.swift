// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBuddyAPI",
    platforms: [.macOS(.v15), .iOS(.v13)],
    products: [
        .library(name: "TMDBuddyAPI", targets: ["TMDBuddyAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0")
    ],
    targets: [
        .target(
            name: "TMDBuddyAPI",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
        .testTarget(
            name: "TMDBuddyAPITests",
            dependencies: ["TMDBuddyAPI"],
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
    ],
    swiftLanguageModes: [.version("6.0")]
)
