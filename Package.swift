// swift-tools-version: 5.6

import PackageDescription

let version = "4.0.0"

let package = Package(
  name: "FlowplayerSDK",
  platforms: [
    .iOS(.v14),
    .tvOS(.v14),
  ],
  products: [
    .library(
      name: "FlowplayerSDK",
      targets: ["FlowplayerSDK"]
    ),
  ],
  targets: [
    .binaryTarget(
      name: "FlowplayerSDK",
      url: "https://github.com/flowplayer/apple-sdk-releases/releases/download/\(version)/FlowplayerSDK.zip",
      checksum: "02d6101b7a6c9c923fbbf674c9158bfd37abe7fa2847686e8d92a07a6dfebc0e"
    ),
  ]
)