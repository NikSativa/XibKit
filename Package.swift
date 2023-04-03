// swift-tools-version:5.7
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "NHelpers",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "NXibView", targets: ["NXibView"]),
        .library(name: "NXibViewTestHelpers", targets: ["NXibViewTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/NSpry.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(name: "NXibView",
                dependencies: [
                ],
                path: "Source"),
        .target(name: "NXibViewTestHelpers",
                dependencies: [
                    "NXibView",
                    "NSpry"
                ],
                path: "TestHelpers"),
        .testTarget(name: "NXibViewTests",
                    dependencies: [
                        "NSpry",
                        "NXibView",
                        "NXibViewTestHelpers"
                    ],
                    path: "Tests")
    ]
)
