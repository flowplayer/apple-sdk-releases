// swift-tools-version: 5.6

import PackageDescription

let version = "4.7.0-rc.3"

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
      checksum: "3ceee8ff3513bb5413dcb4854b6754f8403c2c146d60b6072b669972e01beb87"
    ),
  ]
)
