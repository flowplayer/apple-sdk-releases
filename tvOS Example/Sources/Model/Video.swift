//
//  Video.swift
//  tvOS Example
//
//  Created by @rashadatjou on 14/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
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
      description: "You need to watch this fascinating documentary that unveils the mysteries of our universe, from the birth of stars to the depths of black holes. It's a captivating journey filled with awe-inspiring visuals and mind-boggling theories. Prepare to have your mind expanded as you delve into the secrets of existence and ponder our place in the cosmos. Don't miss out on this incredible exploration of the unknown",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "d55c6dbe-a814-46ee-86aa-39e086c3eaa6",
        playerId: "08cd7685-d8e9-47fb-a639-05ff650b1b34"
      )
    ),
    Video(
      title: "Live Example",
      description: "This is a live broadcast of an electrifying event that will keep you on the edge of your seat. Witness the adrenaline-pumping action as athletes push their limits, racing against time and each other. Feel the thrill of the moment as emotions run high and records are shattered. From breathtaking stunts to nail-biting competitions, this broadcast promises non-stop excitement and unforgettable moments. Tune in now and be part of the exhilarating experience that will leave you breathless!",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "d47d4063-e018-4782-84ca-6491fcfc334d",
        playerId: "08cd7685-d8e9-47fb-a639-05ff650b1b34"
      )
    ),
    Video(
      title: "Local file example",
      description: "This is a local file filled with valuable information that is essential for your project. Unlock the power of knowledge as you dive into its contents, exploring a treasure trove of insights and data. From meticulously curated research to insightful analysis, this file holds the key to unlocking your success. With every page, you'll discover new perspectives and untapped opportunities that will propel you towards your goals. Embrace the power of this local file and harness its potential to make informed decisions and achieve remarkable outcomes.",
      thumbnail: "img.placeholder.gray",
      media: MediaExternal(
        url: URL(fileURLWithPath:
          Bundle.main.path(
            forResource: "BigBackBunny", ofType: "mp4"
          )!
        )
      )
    ),
    Video(
      title: "OVP Example with Ads",
      description: "This is an engaging OVP (Online Video Platform) example video with captivating content that will both entertain and inform you. Prepare to be entertained by the seamless integration of strategically placed ads that add a touch of excitement and variety to the viewing experience. This video showcases the versatility and effectiveness of the OVP, highlighting how it seamlessly blends engaging content with relevant advertisements. Get ready to immerse yourself in a video that not only delivers valuable information but also demonstrates the power of effective advertising in the digital realm. Sit back, relax, and enjoy this OVP example video with ads that will leave you both entertained and enlightened.",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "98665882-74a0-41bd-b17f-3adf28d01994",
        playerId: "d3b7734a-be56-4028-8b6b-056a67d474e0"
      )
    )
  ]
}
