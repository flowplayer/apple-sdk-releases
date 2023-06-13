//
//  Video.swift
//  iOS Example
//
//  Created by Wolf on 01/06/2023.
//

import FlowplayerSDK
import Foundation

struct Video {
  var title: String
  var description: String
  var thumbnail: String
  var media: Media
}

func loadVideoList() -> [Video] {
  [
    Video(
      title: "OVP Example",
      description: "You need to watch this",
      thumbnail: "img.placeholder",
      media: MediaOVP(
        mediaId: "d55c6dbe-a814-46ee-86aa-39e086c3eaa6",
        playerId: "d3b7734a-be56-4028-8b6b-056a67d474e0"
      )
    ),
    Video(
      title: "Live Example",
      description: "This is a live broadcast",
      thumbnail: "img.placeholder",
      media: MediaOVP(
        mediaId: "d47d4063-e018-4782-84ca-6491fcfc334d",
        playerId: "d3b7734a-be56-4028-8b6b-056a67d474e0"
      )
    ),
  ]
}
