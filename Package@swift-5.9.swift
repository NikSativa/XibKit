// swift-tools-version:5.9
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
        .package(url: "https://github.com/NikSativa/SpryKit.git", .upToNextMajor(from: "3.0.0"))
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
