// swift-tools-version: 5.6

import PackageDescription

let version = "4.4.0"

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
      checksum: "3ab0d264bf817eb838b1f232ab644f72a35ea3c300a47e86f3a9319d4b72fe28"
    ),
  ]
)
