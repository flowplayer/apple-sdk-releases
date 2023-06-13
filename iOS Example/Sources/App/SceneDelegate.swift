//
//  SceneDelegate.swift
//  iOS Example
//
//  Created by @rashadatjou on 01/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import UIKit
import AVFoundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  private var savedPlayerInstance: AVPlayer?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let _ = (scene as? UIWindowScene) else { return }
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    //    Uncomment code to enable background playback
    //    guard (savedPlayerInstance != nil) else { return }
    //    // Continue Foreground playback if there was a saved player instance
    //    guard let topController = window?.getTopViewController() as? PlayerController else {
    //      return
    //    }
    //
    //    topController.videoController.avPlayer = self.savedPlayerInstance // Reconnect
    //    self.savedPlayerInstance = nil
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    //    Uncomment code to enable background playback
    //    guard let topController = window?.getTopViewController() as? PlayerController else {
    //      return
    //    }
    //    savedPlayerInstance = topController.videoController.avPlayer
    //
    //    // Continue playback in the background
    //    topController.videoController.avPlayer = nil
  }
}
