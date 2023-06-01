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
    Flowplayer.current.accessToken = "<ADD_YOUR_TOKEN>"
    Flowplayer.current.configure()

    return true
  }
}
