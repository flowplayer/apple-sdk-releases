//
//  AppDelegate.swift
//  tvOS Example
//
//  Created by @rashadatjou on 14/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Flowplayer.current.accessToken = "eyJraWQiOiJnd01RRWVFcU8xV0wiLCJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJjIjoie1wiYWNsXCI6NixcImlkXCI6XCJnd01RRWVFcU8xV0xcIn0iLCJpc3MiOiJGbG93cGxheWVyIn0.YIBd-o7C17_1TE_3FT3m_noxpn-eGIvT8RLuWSAbRrHVIAFpoRq_mB3BQ0Hf5VC3NRYDMJ3PWp4DZy3egqx-fg"
    Flowplayer.current.configure()

    return true
  }
}
