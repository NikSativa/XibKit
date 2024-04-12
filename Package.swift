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
        .library(name: "XibKit", targets: ["XibKit"])
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
        .testTarget(name: "XibKitTests",
                    dependencies: [
                        "SpryKit",
                        "XibKit"
                    ],
                    path: "Tests")
    ]
)
