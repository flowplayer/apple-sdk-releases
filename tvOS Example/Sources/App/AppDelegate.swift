//
//  AppDelegate.swift
//  tvOS Example
//
//  Created by Wolf on 14/06/2023.
//

import FlowplayerSDK
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Flowplayer.current.accessToken = "ACCESS_TOKEN"
    Flowplayer.current.configure()

    return true
  }
}
