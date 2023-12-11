//
//  NowPlayingController.swift
//  iOS Example
//
//  Created by Wolf on 11/12/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import MediaPlayer
import UIKit

class NowPlayingController: UIViewController {
  @IBOutlet
  var flowplayer: FlowplayerView!

  var video: VideoSingle?

  private var nowPlayingInfo = [String: Any]() {
    didSet {
      infoCenter.nowPlayingInfo = nowPlayingInfo
    }
  }

  private let commandCenter = MPRemoteCommandCenter.shared()
  private let infoCenter = MPNowPlayingInfoCenter.default()

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let video else {
      fatalError("Property `video` was not set.")
    }

    // Activate remote controls
    UIApplication.shared.beginReceivingRemoteControlEvents()

    let media = video.media

    flowplayer.autoPlay = true
    flowplayer.delegate = self
    flowplayer.adDelegate = self
    flowplayer.viewDelegate = self
    flowplayer.backgroundColor = .black
    flowplayer.enableBackgroundPlayback = true

    let configBuilder = ControlsConfig.create()
    configBuilder.setMuteControl(true)
    configBuilder.enablePlugins(["speed", "asel", "subtitles"])
    configBuilder.setCustom(key: "speed.options", value: [0.5, 1.0, 2.0])
    configBuilder.setCustom(key: "speed.labels", value: ["Slow", "Normal", "Fast"])
    flowplayer.controlsConfig = configBuilder.build()

    if let ovpMedia = media as? MediaOVP {
      flowplayer.load(ovp: ovpMedia)
    }

    if let externalMedia = media as? MediaExternal {
      flowplayer.load(external: externalMedia)
    }

    setupRemoteCommandCenter()
  }
}

// MARK: FlowplayerDelegate

extension NowPlayingController: FlowplayerDelegate {
  func player(_ api: FlowplayerAPI, didChangeState state: PlayerState) {
    print("Player did change state to: \(state)")

    if state == .ready {
      nowPlayingInfo[MPMediaItemPropertyTitle] = "Title – Song name"
      nowPlayingInfo[MPMediaItemPropertyArtist] = "Some Artist"
    }

    if api.playbackState == .background && state == .pause {
      api.play()
    }
  }

  func player(_: FlowplayerAPI, didFailWith error: PlayerError) {
    print("Oops, the player encountered an error", error)
  }

  func player(_: FlowplayerAPI, didChangePlaybackState state: PlaybackState) {
    print("PlaybackState changed to: \(state)")
  }

  func player(_: FlowplayerAPI, didChangePosition position: Double) {
    nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = position
  }

  func player(_: FlowplayerAPI, didChangeDuration duration: Double) {
    nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = duration
  }

  func player(_: FlowplayerAPI, didChangeMute mute: Bool) {
    print(mute)
  }

  func player(_: FlowplayerAPI, didChangeRate rate: Float) {
    nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = rate
  }

  func player(_: FlowplayerAPI, didChangeVolume volume: Float) {
    print(volume)
  }
}

// MARK: FlowplayerViewDelegate

extension NowPlayingController: FlowplayerViewDelegate {
  func view(_: FlowplayerViewAPI, didEncounterError error: Error?) {
    guard let error else { return }
    print("Oh no, I have encountered an error!")
    print(error)
  }

  func view(_: FlowplayerViewAPI, didChangeFullscreen isFullscreen: Bool) {
    print("isFullscreen:", isFullscreen)
  }

  func view(_: FlowplayerViewAPI, didChangeControlsVisibility isVisible: Bool) {
    print("ControlsVisibility:", isVisible)
  }

  func view(_: FlowplayerViewAPI, didChangeViewVisibility isVisible: Bool) {
    print("View did change visibility to:", isVisible ? "visible" : "hidden")
  }
}

// MARK: - FlowplayerAdDelegate

extension NowPlayingController: FlowplayerAdDelegate {
  func player(_: FlowplayerAPI, didAdFailWith error: AdError) {
    print("Ad failed with error: \(error)")
  }

  func player(_: FlowplayerAPI, didChangeAdState state: AdState, for adType: AdType) {
    print("Ad of type: \(adType) changed state: \(state)")
  }
}

// MARK: - Private

extension NowPlayingController {
  private func setupRemoteCommandCenter() {
    commandCenter.skipBackwardCommand.isEnabled = false
    commandCenter.skipForwardCommand.isEnabled = false
    commandCenter.playCommand.isEnabled = true
    commandCenter.pauseCommand.isEnabled = true
    commandCenter.previousTrackCommand.isEnabled = false
    commandCenter.nextTrackCommand.isEnabled = false
    commandCenter.stopCommand.isEnabled = false

    commandCenter.playCommand.addTarget { [unowned self] _ in

      if flowplayer.state == .pause {
        flowplayer.play()
        return .success
      }

      return .commandFailed
    }

    commandCenter.pauseCommand.addTarget { [unowned self] _ in

      if flowplayer.state == .play {
        flowplayer.pause()
        return .success
      }

      return .commandFailed
    }
  }
}
