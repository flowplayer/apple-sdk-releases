//
//  PlayController.swift
//  Basic
//
//  Created by Wolf on 13/06/2023.
//

import FlowplayerSDK
import UIKit

class PlayController: UIViewController {
  // - IBOutlets
  @IBOutlet var playerView: FlowplayerView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!

  // - Props
  var video: Video?

  // - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    titleLabel.text = video?.title
    descriptionLabel.text = video?.description

    playerView.viewDelegate = self
    playerView.autoPlay = true

    if let ovpMedia = video?.media as? MediaOVP {
      playerView.load(ovp: ovpMedia)
    }

    if let externalMedia = video?.media as? MediaExternal {
      playerView.load(external: externalMedia)
    }
  }
}

// MARK: - FlowplayerViewDelegate

extension PlayController: FlowplayerViewDelegate {
  func view(_ view: FlowplayerViewAPI, didChangeViewVibility isVisible: Bool) {
    print("Flowplayer became visible:", isVisible)
  }
}

// MARK: - FlowplayerDelegate

extension PlayController: FlowplayerDelegate {
  func player(_ player: FlowplayerAPI, didChangeState state: PlayerState) {
    print("Player did change the state:", state)
  }
}
