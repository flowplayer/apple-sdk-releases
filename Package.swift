// swift-tools-version: 5.6

import PackageDescription

let version = "4.8.1"

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
      checksum: "02016eb0de161ae66ed30ee88b2b6aa164e3ba8893177bddc0ebd549a1f28356"
    ),
  ]
)
