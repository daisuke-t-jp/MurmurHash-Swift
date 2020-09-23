// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(Linux) || os(macOS) || os(iOS) || os(tvOS)
let package = Package(
    name: "MurmurHash-Swift",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MurmurHash-Swift",
            targets: ["MurmurHash_Swift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MurmurHash_Swift",
            dependencies: [],
            path: "Sources/MurmurHash/",
            exclude: ["MurmurHash.xcodeproj", "README.md", "Sources/MurmurHash/Info.plist", "Sources/MurmurHash/MurmurHash.h"]),
        .testTarget(
            name: "MurmurHashTests",
            dependencies: ["MurmurHash_Swift"]),
    ],
    swiftLanguageVersions: [.v5]
)
#else
fatalError("Unsupported OS")
#endif
