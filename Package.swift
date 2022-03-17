// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextSpeaker",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "TextSpeaker",
            targets: ["TextSpeaker"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TextSpeaker",
            dependencies: []
        ),
        .testTarget(
            name: "TextSpeakerTests",
            dependencies: ["TextSpeaker"]
        )
    ]
)
