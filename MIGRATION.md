# Migration guide

## 1. Introduction

This guide is a resource for migrating existing projects currently utilizing our legacy iOS and tvOS SDKs to our new multi-platform Wowza Flowplayer Apple SDK. You can find step-by-step instructions and explanations to ensure a smooth and successful migration.

Migrating to the new Wowza Flowplayer Apple SDK offers several significant advantages:

- The SDK was optimized to be four times lighter, resulting in reduced resource consumption within your application.
- The new SDK exposes a much richer API, providing developers with greater flexibility and control over the Wowza Flowplayer integration.
- The latest SDK incorporates numerous enhancements and new functionalities, making it superior to its predecessors in every aspect.

By migrating, you can take advantage of these improvements and deliver an even better video playback experience to your users.

## 2. Prerequisites

| Requirement                     | Version information                                                                                                                                                                                                                                                                        |
| :------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Minimum system requirements** | Swift 5.7 <br/> macOS 13.0                                                                                                                                                                                                                                                                 |
| **Dependencies and versions**   | Google IMA SDK iOS 3.8.5 (exact version) <br/> Google IMA SDK tvOS 4.19.1 (exact version)                                                                                                                                                                                                  |
| **Software requirements**       | [Xcode 14.2](https://developer.apple.com/download/all/?q=xcode%2014.2) (includes Swift 5.7) <br /> [Git](https://git-scm.com/downloads) <br/> [Flowplayer Online Video Platform (OVP)](https://app.flowplayer.com/) <br /> [Wowza Video](https://auth.wowza.com/login?onsuccess=https://video.wowza.com/en/manage) |

## 3. Migration process

### Pre-migration tasks

#### Check compatibility with existing setup

Ensure that the minimum deployment version of your iOS and tvOS app is set to `14.0`, or use version conditionals in your code where needed. This is the minimum version supported by the new Wowza Flowplayer Apple SDK. Adjusting the deployment version ensures that your application can effectively utilize the features and functionalities offered by the OS.

#### Evaluate any additional requirements

An important step is to remove the legacy frameworks from CocoaPods if it was previously installed through that dependency manager. You can do this by updating your project's Podfile and removing any references to the old Flowplayer frameworks.

Similarly, if the legacy Flowplayer framework was manually installed, remove it from your project's frameworks. Do not delete any of the code as we're going to need it later.

### Installation and setup

Download [the new Apple SDKs](https://github.com/flowplayer/apple-sdk-releases/blob/main/README.md#add-the-sdk-to-your-project). You can also get started with our official [Wowza Flowplayer Apple SDK](https://developer.wowza.com/docs/wowza-flowplayer/apple-sdk/about-the-apple-sdk/) documentation.

### Module changes

Please consider the following module changes:

- Remove all references to `import FlowplayerCore` from your project.
- Rename all references from `import Flowplayer` -> `import FlowplayerSDK`.
- Consuming events from the player instance is now handled by three different delegates:

  - `FlowplayerDelegate`: Responsible for all player related events.
  - `FlowplayerAdDelegate`: Responsible for all ad related events.
  - `FlowplayerViewDelegate`: Responsible for all view related events (iOS only).

- We also added support for `NotificationCenter`. To learn more, see [Listen for events](https://developer.wowza.com/docs/wowza-flowplayer/apple-sdk/listen-for-events/).

## 4. FlowplayerSDK for iOS key changes

`FPFlowplayerViewController: UIViewController` was removed and replaced with a much lighter `FlowplayerView: UIVew`. To learn more about `FlowplayerView`, see [our documentation](https://developer.wowza.com/docs/wowza-flowplayer/apple-sdk/set-up-the-player/#ios-projects).

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

`FPFlowplayer` was removed and replaced with a much more robust `FlowplayerManager`. The behavior of both classes is identical and doesn't require much change. To learn more about `FlowplayerManager`, see [our documentation](https://developer.wowza.com/docs/wowza-flowplayer/apple-sdk/set-up-the-player/#tvos-projects).

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

## 6. Additional resources

Visit our official [Wowza Flowplayer Apple SDK](https://developer.wowza.com/docs/wowza-flowplayer/apple-sdk/about-the-apple-sdk/) documentation.

For assistance with the Wowza Flowplayer Apple SDK, please contact <mehdi.rashadatjou@wowza.com>.
