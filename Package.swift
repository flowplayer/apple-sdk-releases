// swift-tools-version: 5.6

import PackageDescription

let version = "4.7.1"

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
      checksum: "149fe952489b2dd3148ad9b5f23f4fc30c4a6132d0caeaf558cfe03dba6f18c1"
    ),
  ]
)
