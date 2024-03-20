// swift-tools-version:5.8
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "NXibView",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "NXibView", targets: ["NXibView"]),
        .library(name: "NXibViewTestHelpers", targets: ["NXibViewTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/NSpry.git", .upToNextMajor(from: "2.1.4"))
    ],
    targets: [
        .target(name: "NXibView",
                dependencies: [
                ],
                path: "Source",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "NXibViewTestHelpers",
                dependencies: [
                    "NXibView",
                    "NSpry"
                ],
                path: "TestHelpers",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "NXibViewTests",
                    dependencies: [
                        "NSpry",
                        "NXibView",
                        "NXibViewTestHelpers"
                    ],
                    path: "Tests")
    ]
)
