// swift-tools-version: 5.6

import PackageDescription

let version = "<version>"

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
      url: "https://example.com/some/url/\(version)/FlowplayerSDK.zip",
      checksum: "<checksum>"
    ),
  ]
)
