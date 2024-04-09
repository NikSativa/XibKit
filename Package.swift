// swift-tools-version:5.8
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "XibKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "XibKit", targets: ["XibKit"]),
        .library(name: "XibKitTestHelpers", targets: ["XibKitTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/SpryKit.git", .upToNextMajor(from: "2.2.0"))
    ],
    targets: [
        .target(name: "XibKit",
                dependencies: [
                ],
                path: "Source",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "XibKitTestHelpers",
                dependencies: [
                    "XibKit",
                    "SpryKit"
                ],
                path: "TestHelpers",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "XibKitTests",
                    dependencies: [
                        "SpryKit",
                        "XibKit",
                        "XibKitTestHelpers"
                    ],
                    path: "Tests")
    ]
)
