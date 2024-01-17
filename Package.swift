// swift-tools-version: 5.6

import PackageDescription

let version = "4.6.0"

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
      checksum: "af78ba1adcb3fbc77fac60d99604713b3658cac6b8f3f77a95851406e85dbf8d"
    ),
  ]
)
