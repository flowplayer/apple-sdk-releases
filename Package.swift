// swift-tools-version: 5.6

import PackageDescription

let version = "4.8.2-rc.0"

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
      checksum: "b5a8feef6b64627f57a0f33d76a5785a9a13fdb93a7fa9d946bef96598948df9"
    ),
  ]
)
