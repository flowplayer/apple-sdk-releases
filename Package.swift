// swift-tools-version: 5.6

import PackageDescription

let version = "4.8.1-rc.0"

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
      checksum: "bc27936016b36a41d3ac2dccae31142e3331748dd000a6709e2c368f47036b73"
    ),
  ]
)
