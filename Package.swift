// swift-tools-version: 5.6

import PackageDescription

let version = "4.7.0-rc.1"

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
      checksum: "a95b2bc523d5861b0135b8b5d9746c324b2ccf4c95a3aee9321f9d95bc02b1a9"
    ),
  ]
)
