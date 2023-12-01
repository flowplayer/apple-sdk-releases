//
//  PlayController.swift
//  tvOS Example
//
//  Created by @rashadatjou on 14/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import AVKit
import FlowplayerSDK
import UIKit

class PlayController: UIViewController {
  // - Services
  private var manager: FlowplayerManager
  private let player = AVPlayer()
  private let playerController = AVPlayerViewController()

  // - Props
  var video: VideoSingle

  // - Lifecycle
  init(video: VideoSingle) {
    self.video = video
    // TODO: Set the ID here
    self.manager = FlowplayerManager(avPlayer: player)
    super.init(nibName: nil, bundle: .main)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    manager.delegate = self
    manager.adDelegate = self
    manager.autoPlay = true
    manager.adViewController = playerController

    playerController.player = player
    playerController.modalPresentationStyle = .fullScreen
    playerController.delegate = self

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
      present(playerController, animated: false) {
        let video = self.video
        let media = video.media

        if let mediaOvp = media as? MediaOVP {
          self.manager.load(ovp: mediaOvp)
        }

        if let mediaExternal = media as? MediaExternal {
          self.manager.load(external: mediaExternal)
        }
      }
    }
  }
}

// MARK: - AVPlayerControllerDelegate

extension PlayController: AVPlayerViewControllerDelegate {
  func playerViewControllerWillBeginDismissalTransition(_ playerViewController: AVPlayerViewController) {
    // Stop flowplayer playback
    dismiss(animated: true)
  }
}

// MARK: - FlowplayerDelegate

extension PlayController: FlowplayerDelegate {
  func player(_ player: FlowplayerAPI, didChangeState state: PlayerState) {
    print(player, "didChangeState", state)
  }
}

// MARK: - FlowplayerAdDelegate

extension PlayController: FlowplayerAdDelegate {
  func player(_ player: FlowplayerAPI, didChangeAdState state: AdState, for adType: AdType) {
    print(player, "didChangeAdState", state, "for", adType)
  }
}
