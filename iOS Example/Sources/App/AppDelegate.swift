//
//  AppDelegate.swift
//  iOS Example
//
//  Created by @rashadatjou on 01/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    Flowplayer.current.accessToken = "eyJraWQiOiJnd01RRWVFcU8xV0wiLCJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJjIjoie1wiYWNsXCI6NixcImlkXCI6XCJnd01RRWVFcU8xV0xcIn0iLCJpc3MiOiJGbG93cGxheWVyIn0.YIBd-o7C17_1TE_3FT3m_noxpn-eGIvT8RLuWSAbRrHVIAFpoRq_mB3BQ0Hf5VC3NRYDMJ3PWp4DZy3egqx-fg"
    Flowplayer.current.configure()

    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
