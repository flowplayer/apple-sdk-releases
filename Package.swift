// swift-tools-version: 5.6

import PackageDescription

let version = "4.6.1"

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
      checksum: "0a27bfd04b71da77eed204a1b92fa85dc9b12789bae277fd880c8a447d275d80"
    ),
  ]
)
