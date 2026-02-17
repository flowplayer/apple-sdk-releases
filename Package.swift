// swift-tools-version: 5.6

import PackageDescription

let version = "4.8.2-test"

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
      checksum: "4ffd2b3303ad2eabd5764099af75db8714ecf5aac8b94b1eb33db96e625ddd05"
    ),
  ]
)
