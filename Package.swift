// swift-tools-version: 5.6

import PackageDescription

let version = "4.8.1-rc.0"

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
      checksum: "80c5f0306d0ffe092468b6effbca29c91652e087779b91afb45309dcdf6709c2"
    ),
  ]
)
