// swift-tools-version: 5.6

import PackageDescription

let version = "4.0.0-rc.1"

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
      checksum: "38dc1f789192157afdb457a5a947b8500771aea8a5395ef2d90c60c8b5889988"
    ),
  ]
)
