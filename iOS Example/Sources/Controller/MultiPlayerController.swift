//
//  MultiPlayerController.swift
//  iOS Example
//
//  Created by @rashadatjou on 29/11/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import UIKit

class MultiPlayerController: UIViewController {
  // - IBOutlets
  @IBOutlet var playerOne: FlowplayerView!
  @IBOutlet var playerTwo: FlowplayerView!

  // - Props
  var video: VideoMulti?

  // - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let video else {
      fatalError("Property ``videos`` was not set.")
    }

    setupPlayerOne()
    setupPlayerTwo()

    let mediaList = video.list
    load(player: playerOne, with: mediaList[0])
    load(player: playerTwo, with: mediaList[1])
  }

  deinit {
    // IMPORTANT: After version 4.3.0 no need to call `playerView.stop()`
  }
}

// MARK: - FlowplayerViewDelegate

extension MultiPlayerController: FlowplayerViewDelegate {
  func view(_ view: FlowplayerViewAPI, didChangeViewVisibility isVisible: Bool) {
    // TODO: Add 'id' prop check
    print("Flowplayer became visible:", isVisible)
  }
}

// MARK: - FlowplayerDelegate

extension MultiPlayerController: FlowplayerDelegate {
  func player(_ player: FlowplayerAPI, didChangeState state: PlayerState) {
    // TODO: Add 'id' prop check
    print("Player did change the state:", state)
  }
}

// MARK: - Private

extension MultiPlayerController {
  private func setupPlayerOne() {
    playerOne.backgroundColor = .red
    playerOne.autoPlay = true
    playerOne.delegate = self
    playerOne.viewDelegate = self
    playerOne.controlsConfig = setupDefaultControls()
  }

  private func setupPlayerTwo() {
    playerTwo.backgroundColor = .blue
    playerTwo.autoPlay = true
    playerTwo.delegate = self
    playerTwo.viewDelegate = self
    playerTwo.controlsConfig = setupDefaultControls()
  }

  private func setupDefaultControls() -> ControlsConfig {
    let configBuilder = ControlsConfig.create()
    configBuilder.setMuteControl(true)
    configBuilder.enablePlugins(["speed", "asel", "subtitles"])
    configBuilder.setCustom(key: "speed.options", value: [0.5, 1.0, 2.0])
    configBuilder.setCustom(key: "speed.labels", value: ["Slow", "Normal", "Fast"])
    return configBuilder.build()
  }

  private func load(player: FlowplayerAPI, with media: Media) {
    if let ovpMedia = media as? MediaOVP {
      player.load(ovp: ovpMedia)
    }

    if let externalMedia = media as? MediaExternal {
      player.load(external: externalMedia)
    }
  }
}
