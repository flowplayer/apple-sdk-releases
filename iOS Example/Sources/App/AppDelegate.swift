//
//  AppDelegate.swift
//  iOS Example
//
//  Created by @rashadatjou on 01/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import AVFoundation
import FlowplayerSDK
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    Flowplayer.current.accessToken = "eyJraWQiOiJtb2pTdFFGMXoxcUQiLCJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJjIjoie1wiYWNsXCI6NixcImlkXCI6XCJtb2pTdFFGMXoxcURcIn0iLCJpc3MiOiJGbG93cGxheWVyIn0.j8ZR7RcXkXBMEepRpMrPBy91fjgrCi1ukHr0UJKX1bbHxMABaoPHHsZ2e7mS6nxtZlpaEyUSI9Bb8HLJSYBxHw"
    Flowplayer.current.configure()

    // Needed to play audio on a physical device
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback)
      try AVAudioSession.sharedInstance().setActive(true)
    } catch {
      print("Error setting up audio session: \(error)")
    }

    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
