// swift-tools-version:6.0
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "XibKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "XibKit", targets: ["XibKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/SpryKit.git", from: "3.0.4")
    ],
    targets: [
        .target(name: "XibKit",
                dependencies: [
                ],
                path: "Source",
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "XibKitTests",
                    dependencies: [
                        "SpryKit",
                        "XibKit"
                    ],
                    path: "Tests")
    ]
)
