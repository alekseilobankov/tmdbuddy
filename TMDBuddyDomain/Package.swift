// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBuddyDomain",
    platforms: [.macOS(.v15), .iOS(.v13)],
    products: [
        .library(name: "TMDBuddyDomain", targets: ["TMDBuddyDomain"]),
    ],
    targets: [
        .target(name: "TMDBuddyDomain"),
        .testTarget(name: "TMDBuddyDomainTests", dependencies: ["TMDBuddyDomain"]),
    ],
    swiftLanguageVersions: [.version("6.0")]
)
