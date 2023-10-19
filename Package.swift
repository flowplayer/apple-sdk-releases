// swift-tools-version: 5.6

import PackageDescription

let version = "4.2.2"

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
      checksum: "43547a869cf266b6bbdf2d3efdb516c6dead694cff50eb7508cd42eafc0b60cb"
    ),
  ]
)
