// swift-tools-version: 5.6

import PackageDescription

let version = "4.1.1"

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
      checksum: "d5b059ed8745e8e5bab4ee109b7c523f35c0ffafb4b8a60e3fda9bd5ea54ab2d"
    ),
  ]
)
