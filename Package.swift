// swift-tools-version: 5.6

import PackageDescription

let version = "4.6.2"

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
      checksum: "6e95ce8b25fa748de456b80c7cf80ebeea2d0460b874542a077258e40689fe69"
    ),
  ]
)
