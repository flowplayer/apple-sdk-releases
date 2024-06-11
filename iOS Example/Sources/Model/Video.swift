//
//  Video.swift
//  iOS Example
//
//  Created by @rashadatjou on 01/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import Foundation

protocol Video {
  var title: String { get }
  var description: String { get }
  var thumbnail: String { get }
}

struct VideoSingle: Video {
  var title: String
  var description: String
  var thumbnail: String
  let media: Media
}

struct VideoMulti: Video {
  var title: String
  var description: String
  var thumbnail: String
  let list: [Media]
}

struct VideoSection {
  let title: String
  let list: [Video]
  var type: PlayerType

  enum PlayerType {
    case single
    case multiple
    case nowPlaying
  }
}

// MARK: - Static Data

private func loadVODList() -> [VideoSingle] {
  [
    VideoSingle(
      title: "OVP Example",
      description: "You need to watch this fascinating documentary that unveils the mysteries of our universe, from the birth of stars to the depths of black holes. It's a captivating journey filled with awe-inspiring visuals and mind-boggling theories. Prepare to have your mind expanded as you delve into the secrets of existence and ponder our place in the cosmos. Don't miss out on this incredible exploration of the unknown",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "d55c6dbe-a814-46ee-86aa-39e086c3eaa6",
        playerId: "08cd7685-d8e9-47fb-a639-05ff650b1b34"
      )
    ),
    VideoSingle(
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
    VideoSingle(
      title: "OVP Example with Ads",
      description: "This is an engaging OVP (Online Video Platform) example video with captivating content that will both entertain and inform you. Prepare to be entertained by the seamless integration of strategically placed ads that add a touch of excitement and variety to the viewing experience. This video showcases the versatility and effectiveness of the OVP, highlighting how it seamlessly blends engaging content with relevant advertisements. Get ready to immerse yourself in a video that not only delivers valuable information but also demonstrates the power of effective advertising in the digital realm. Sit back, relax, and enjoy this OVP example video with ads that will leave you both entertained and enlightened.",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "98665882-74a0-41bd-b17f-3adf28d01994",
        playerId: "d3b7734a-be56-4028-8b6b-056a67d474e0"
      )
    ),
  ]
}

private func loadRemoteList() -> [VideoSingle] {
  return [
    .init(
      title: "Remote examples with remote AdSchedule",
      description: "This is a remote exampel livestream with an custom AdScheduleWaterfall.",
      thumbnail: "img.placeholder.gray",
      media: MediaExternal(
        url: URL(
          string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"
        )!,
        adSchedule: AdScheduleWaterfall(
          preAdBreak: AdBreak(
            adTags: ["https://pubads.g.doubleclick.net/gampad/ads?iu=/21775744923/external/single_preroll_skippable&sz=640x480&ciu_szs=300x250%2C728x90&gdfp_req=1&output=vast&unviewed_position_start=1&env=vp&impl=s&correlator="]
          ),
          midAdBreak: nil,
          postAdBreak: nil
        )
      )
    ),
  ]
}

private func loadLIVEList() -> [VideoSingle] {
  [
    VideoSingle(
      title: "OVP Live Example",
      description: "This is a live broadcast of an electrifying event that will keep you on the edge of your seat. Witness the adrenaline-pumping action as athletes push their limits, racing against time and each other. Feel the thrill of the moment as emotions run high and records are shattered. From breathtaking stunts to nail-biting competitions, this broadcast promises non-stop excitement and unforgettable moments. Tune in now and be part of the exhilarating experience that will leave you breathless!",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "d47d4063-e018-4782-84ca-6491fcfc334d",
        playerId: "08cd7685-d8e9-47fb-a639-05ff650b1b34"
      )
    ),
    VideoSingle(
      title: "External Live Example",
      description: "This is a live broadcast of an electrifying event that will keep you on the edge of your seat. Witness the adrenaline-pumping action as athletes push their limits, racing against time and each other. Feel the thrill of the moment as emotions run high and records are shattered. From breathtaking stunts to nail-biting competitions, this broadcast promises non-stop excitement and unforgettable moments. Tune in now and be part of the exhilarating experience that will leave you breathless!",
      thumbnail: "img.placeholder.gray",
      media: MediaExternal(
        url: .init(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"
        )!
      )
    ),
  ]
}

private func loadNowPlayingList() -> [VideoSingle] {
  [
    VideoSingle(
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
  ]
}

private func loadMultiList() -> [VideoMulti] {
  return [
    VideoMulti(
      title: "VOD Example with 2 players",
      description: "VOD Example with 2 players: Two pals, Bob and Alice, battling for the remote! Bob wants sci-fi, Alice insists on rom-coms. Hilarity ensues!",
      thumbnail: "img.placeholder.gray",
      list: [
        MediaOVP(
          mediaId: "98665882-74a0-41bd-b17f-3adf28d01994",
          playerId: "08cd7685-d8e9-47fb-a639-05ff650b1b34"
        ),
        MediaOVP(
          mediaId: "950030b2-3d27-4050-9537-373cd1144f37",
          playerId: "08cd7685-d8e9-47fb-a639-05ff650b1b34"
        ),
      ]
    ),
  ]
}

private func loadDAIList() -> [VideoSingle] {
  [
    .init(
      title: "DAI VOD + Embed Service Sample",
      description: "",
      thumbnail: "img.placeholder.gray",
      media: MediaOVP(
        mediaId: "4de036d4-5b95-4df0-9272-1f22aed31fc6",
        playerId: "75878aa7-f290-4a15-961e-86a146e569c4"
      )
    ),
    .init(
      title: "DAI VOD Stream Sample",
      description: "",
      thumbnail: "img.placeholder.gray",
      media: MediaDAI(
        stream: DAIStreamVOD(
          contentSourceID: "2528370",
          videoID: "tears-of-steel", // manipulate id to trigger backupStream
          bookmark: 10, // skip pre-roll
          backupStream: .init(
            string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"
          )!
        )
      )
    ),
    .init(
      title: "DAI Live stream sample",
      description: "",
      thumbnail: "img.placeholder.gray",
      media: MediaDAI(
        stream: DAIStreamLive(
          assetKey: "c-rArva4ShKVIAkNfy6HUQ",
          backupStream: .init(
            string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"
          )!
        )
      )
    ),
    .init(
      title: "DAI POD Live Stream",
      description: "",
      thumbnail: "img.placeholder.gray",
      media: MediaDAI(
        stream: DAIStreamPodLive(
          networkCode: "51636543",
          streamData: .init(
            streamURL: .init(string: "https://encodersim.sandbox.google.com/masterPlaylist/9c654d63-5373-4673-8c8d-6d92b66b9d46/master.m3u8?gen-seg-redirect=true&network=51636543&event=google-sample&pids=devrel4628000,devrel896000,devrel3528000,devrel1428000,devrel2628000,devrel1928000&seg-host=dai.google.com"
            )!
          ),
          customAssetKey: "google-sample",
          apiKey: "",
          backupStream: .init(string: "http://googleimadev-vh.akamaihd.net/i/big_buck_bunny/bbb-,480p,720p,1080p,.mov.csmil/master.m3u8")!
        )
      )
    ),
  ]
}

func loadVideoList() -> [VideoSection] {
  return [
    VideoSection(title: "VOD Examples", list: loadVODList(), type: .single),
    VideoSection(title: "LIVE Examples", list: loadLIVEList(), type: .single),
    VideoSection(title: "Remote Examples", list: loadRemoteList(), type: .single),
    VideoSection(title: "Now Playing Example", list: loadNowPlayingList(), type: .nowPlaying),
    VideoSection(title: "Multi-Player Examples", list: loadMultiList(), type: .multiple),
    VideoSection(title: "DAI Examples", list: loadDAIList(), type: .single)
  ]
}
