// swift-tools-version: 5.6

import PackageDescription

let version = "4.0.0-rc"

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
      checksum: "8d2a99256f69155101c0520ffbe692e622b5288a91d2891cdddb0da94c7623b0"
    ),
  ]
)
