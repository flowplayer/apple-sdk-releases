// swift-tools-version: 5.6

import PackageDescription

let version = "4.3.1"

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
      checksum: "7bf4ba41887029c7985c0d9e6cf7dd2a0467d5c3d7ffea711709e262e6f2edd7"
    ),
  ]
)
