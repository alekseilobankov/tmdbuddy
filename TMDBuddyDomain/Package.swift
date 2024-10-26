// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBuddyDomain",
    platforms: [.macOS(.v15), .iOS(.v13)],
    products: [
        .library(name: "TMDBuddyDomain", targets: ["TMDBuddyDomain"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0")
    ],
    targets: [
        .target(
            name: "TMDBuddyDomain",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
        .testTarget(
            name: "TMDBuddyDomainTests",
            dependencies: ["TMDBuddyDomain"]
        ),
    ],
    swiftLanguageModes: [.version("6.0")]
)
