// swift-tools-version: 5.6

import PackageDescription

let version = "4.3.0"

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
      checksum: "e7250e2ace0c87501e6e5bccae77c9c99f74a03f2c9c30ef140c1ccb1502b409"
    ),
  ]
)
