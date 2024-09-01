// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBuddySecrets",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "TMDBuddySecrets",
            targets: ["TMDBuddySecrets"]
        ),
    ],
    targets: [
        .target(
            name: "TMDBuddySecrets",
            plugins: ["GenerateEnvironmentalVariablesPlugin"]
        ),
        .executableTarget(
            name: "GenerateEnvironmentalVariablesExec"
        ),
        .plugin(
            name: "GenerateEnvironmentalVariablesPlugin",
            capability: .buildTool(),
            dependencies: ["GenerateEnvironmentalVariablesExec"]
        ),
        .testTarget(name: "TMDBuddySecretsTests", dependencies: ["TMDBuddySecrets"]),
    ]
)
