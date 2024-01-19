//
//  PlayController.swift
//  iOS Example
//
//  Created by @rashadatjou on 13/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import UIKit

class PlayController: UIViewController {
  // - IBOutlets
  @IBOutlet var playerView: FlowplayerView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!

  // - Props
  var video: VideoSingle?

  // - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    initView()
    initPlayer()

    if let ovpMedia = video?.media as? MediaOVP {
      playerView.load(ovp: ovpMedia)
    }

    if let externalMedia = video?.media as? MediaExternal {
      playerView.load(external: externalMedia)
    }
  }

  deinit {
    // IMPORTANT: After version 4.3.0 no need to call `playerView.stop()`
  }
}

// MARK: - FlowplayerViewDelegate

extension PlayController: FlowplayerViewDelegate {
  func view(_ view: FlowplayerViewAPI, didChangeViewVisibility isVisible: Bool) {
    print("Flowplayer became visible:", isVisible)
  }
}

// MARK: - FlowplayerDelegate

extension PlayController: FlowplayerDelegate {
  func player(_ player: FlowplayerAPI, didChangeState state: PlayerState) {
    print("Player did change the state:", state)
  }

  func player(_ player: FlowplayerAPI, didChangePlaybackState state: PlaybackState) {
    print("Playback state did change:", state)

    // Current state is .playing and previous state is .background
    let wasInBackground = player.playbackStateList.prefix(2) == [
      .playing,
      .background
    ]

    /// If player was paused continue playback from the background
    if wasInBackground && player.state == .pause {
      player.play()
    }
  }
}

// MARK: - FlowplayerAdDelegate

extension PlayController: FlowplayerAdDelegate {
  func player(_ player: FlowplayerAPI, didAdFailWith error: AdError, for type: AdType, with metadata: IMAMetadata?) {
    print("Oh noooo  my ads")
    print("ad error:", error)
    print("ad type:", type)
    print("metadata:", metadata)
  }
}

// MARK: - Helpers

extension PlayController {
  private func initView() {
    titleLabel.text = video?.title
    descriptionLabel.text = video?.description
  }

  private func initPlayer() {
    playerView.autoPlay = true
    playerView.viewDelegate = self
    playerView.delegate = self
    playerView.enableBackgroundPlayback = false

    let playerConfiguration = ControlsConfig.create()
    playerConfiguration.setMuteControl(true)
    playerConfiguration.setUseDragHandle(true)
    playerConfiguration.enablePlugins(["speed", "asel", "subtitles"])
    playerConfiguration.setCustom(key: "speed.options", value: [0.5, 1, 2, 5])
    playerConfiguration.setCustom(key: "speed.labels", value: ["Slow", "Normal", "Double", "Fast"])

    let values = playerConfiguration.build()

    playerView.controlsConfig = values
  }
}
