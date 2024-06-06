// swift-tools-version: 5.6

import PackageDescription

let version = "4.7.0-rc.2"

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
      checksum: "1e65fb595f123ddd09d77dcc009a50541bb79ad84c1011e327dba233d5206110"
    ),
  ]
)
