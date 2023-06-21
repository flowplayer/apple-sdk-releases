# Migration Guide

## 1. Introduction

- Purpose of the migration document:

  This guide serves as a comprehensive resource for migrating existing projects that currently utilize the Legacy Flowplayer iOS Framework or the Legacy Flowplayer tvOS Framework to our new Multiplatform Flowplayer SDK. It provides step-by-step instructions and explanations to ensure a smooth and successful migration.

- Benefits of migrating to the new version:

  Migrating to the new Flowplayer SDK offers several significant advantages. Firstly, the SDK has been optimized to be four times lighter, resulting in reduced resource consumption within your application. Additionally, the new SDK exposes a much richer API, providing developers with greater flexibility and control over the Flowplayer integration. Moreover, the latest SDK incorporates numerous enhancements and new functionalities, making it superior to its predecessors in every aspect. By migrating, you can take advantage of these improvements and deliver an even better video playback experience to your users.

## 2. Prerequisites

| Requirement                     | Version information                                                                                                                                                                                                                                                                        |
| :------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Minimum system requirements** | Swift 5.7 <br/> macOS 13.0                                                                                                                                                                                                                                                                 |
| **Dependencies and versions**   | Google IMA SDK iOS 3.8.5 (exact version) <br/> Google IMA SDK tvOS 4.19.1 (exact version)                                                                                                                                                                                                  |
| **Software requirements**       | [Xcode 14.2](https://developer.apple.com/download/all/?q=xcode%2014.2) (includes Swift 5.7) <br /> [Git](https://git-scm.com/downloads) <br/> [Flowplayer OVP](https://app.flowplayer.com/) <br /> [Wowza Video](https://auth.wowza.com/login?onsuccess=https://video.wowza.com/en/manage) |

## 3. Migration Process

### Stage 1: Pre-Migration Tasks

#### - Check compatibility with existing setup:

Ensure that the minimum deployment version of your iOS and tvOS app is set to `14.0` or use version conditionals in your code where needed. This is the minimum version supported by the new Flowplayer SDK. Adjusting the deployment version will ensure that your application can effectively utilize the features and functionalities offered by the OS.

#### - Evaluate any additional requirements:

An important step is to remove the legacy frameworks from CocoaPods if it was previously installed through that dependency manager. You can do this by updating your project's Podfile and removing any references to the old Flowplayer frameworks. Similarly, if the legacy Flowplayer framework was manually installed, ensure that you remove it from your project's frameworks. Do not delete any of the code as we are going to needed it later.

### Stage 2: Installation/Setup

Downloading the new version of the SDK by following our docs [here](https://example.com)

### Stage 3: Module changes

1. Please remove all references to `import FlowplayerCore` from your project.
2. Please rename all references from `import Flowplayer` -> `import FlowplayerSDK`
3. Consuming events from the player instance is now handled by 3 different delegates
   1. `FlowplayerDelegate`: Responsible for all player related events.
   2. `FlowplayerAdDelegate`: Responsible for all ad related events.
   3. `FlowplayerViewDelegate`: Responsible for all view related events (iOS only).
4. We added also support `NotificationCenter` and you can find the list of all events [here](https://example.xom).

## 4. FlowplayerSDK for iOS key changes

- `FPFlowplayerViewController: UIViewController` has been completely removed and has been replaced with a much lighter `FlowplayerView: UIVew`.
- To learn more about `FlowplayerView` please visit our docs [here](https://example.com).

**[Legacy] FPFlowplayerViewController example code**

```Swift

import Flowplayer
import UIKit

class MyViewController: UIViewController, FPFlowplayerDelegate {

  let videoController = FPFlowplayerViewController()

  override func viewDidLoad() {
    super.viewDidLoad()

    let media = // Some media
    let config = // Some config for the player

    videoController.setControlConfig(config)
    view.addSubview(videoController.view)
    videoController.addPlayerDelegate(self)

    videoController.prepare(flowplayerMedia: media, autoStart: true)
  }
}

```

**[New] FlowplayerView example code**

```Swift

import FlowplayerSDK
import UIKit

class MyViewController: UIViewController, FlowplayerViewDelegate, FlowplayerDelegate {
  // - IBOutlets
  @IBOutlet var playerView: FlowplayerView!
  // or let playerView = FlowplayerView()

  // - Props
  var media: Media?

  // - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    playerView.viewDelegate = self
    playerView.autoPlay = true
    playerView.delegate = self
    // view.addSubview(player) if not used as an IBOutlet

    if let ovpMedia = media as? MediaOVP {
      playerView.load(ovp: ovpMedia)
    }

    if let externalMedia = media as? MediaExternal {
      playerView.load(external: externalMedia)
    }
  }
}
```

## 5. FlowplayerSDK for tvOS key changes

- `FPFlowplayer` has been removed and replaced with a much more roboust `FlowplayerManager`. The behavour of both classes is identical and wont require much change.
- To learn more about `FlowplayerManager` please visit the docs [here](https://example.com).

**[Legacy] FPFlowplayer example code**

```Swift
import Flowplayer
import UIKit

class MyViewController: UIViewController {

  // - Props
  private var flowplayer: FPFlowplayer!
  private let player = AVPlayer()
  private let playerController = AVPlayerViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    playerController.player = player
    flowplayer = FPFlowplayer(player: player, controller: playerController)
    flowplayer.delegate = self
  }

}
```

**[New] FlowplayerManager example code**

```Swift
import AVKit
import FlowplayerSDK
import UIKit

class MyViewController: UIViewController, FlowplayerDelegate, FlowplayerAdDelegate {
  // - Services
  private var manager: FlowplayerManager!
  private let player = AVPlayer()
  private let playerController = AVPlayerViewController()

  // - Props
  let media: Media?

  override func viewDidLoad() {
    super.viewDidLoad()
    playerController.player = player

    manager = FlowplayerManager(avPlayer: player)
    manager.delegate = self
    manager.adDelegate = self
    manager.autoPlay = true
    manager.adViewController = playerController

    present(playerController, animated: false) {
      guard let media = self.media else { return }

      if let mediaOvp = media as? MediaOVP {
        self.manager.load(ovp: mediaOvp)
      }

      if let mediaExternal = media as? MediaExternal {
        self.manager.load(external: mediaExternal)
      }
    }
  }
}
```

## 6. Additional Resources

- Visit our docs for a more details [here](https://example.com)
- Please contact mehdi[.]rashadatjou[@]wowza[.]com for any assistance
