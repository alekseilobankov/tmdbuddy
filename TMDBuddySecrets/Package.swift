// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBuddySecrets",
    platforms: [.macOS(.v14), .iOS(.v13)],
    products: [
        .library(
            name: "TMDBuddySecrets",
            targets: ["TMDBuddySecrets"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0")
    ],
    targets: [
        .target(
            name: "TMDBuddySecrets",
            plugins: [
                "GenerateEnvironmentalVariablesPlugin",
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .executableTarget(
            name: "GenerateEnvironmentalVariablesExec",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
        .plugin(
            name: "GenerateEnvironmentalVariablesPlugin",
            capability: .buildTool(),
            dependencies: ["GenerateEnvironmentalVariablesExec"]
        ),
        .testTarget(name: "TMDBuddySecretsTests", dependencies: ["TMDBuddySecrets"]),
    ],
    swiftLanguageModes: [.version("6.0")]
)
