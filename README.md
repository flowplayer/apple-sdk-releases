# Wowza Flowplayer iOS and tvOS SDKs

The Wowza Flowplayer iOS SDK provides a framework to integrate video playback and advertisement capabilities into your iOS and tvOS applications. With this SDK, you can take advantage of a comprehensive set of features and functionalities that enhance the video playback experience for your users.

For more, get started with our official Apple SDK documentation:

- [Wowza Flowplayer iOS SDK](https://developer.wowza.com/docs/wowza-flowplayer/sdks/apple/ios/getting-started/#about-wowza-flowplayer-ios-sdk) documentation
- [Wowza Flowplayer tvOS SDK](https://developer.wowza.com/docs/wowza-flowplayer/sdks/apple/tvos/getting-started/#about-wowza-flowplayer-tvos-sdk) documentation

## Before you start

Before you start with the latest version of the Wowza Flowplayer iOS and tvOS SDKs, check the system requirements, dependencies, and required software in the following table.

| Requirement | Version information |
| :---- | :---- |
| **Minimum system requirements** | Swift 5.7 <br/> macOS 13.0 |
| **Dependencies and versions** | Google IMA SDK iOS 3.8.5 (exact version) <br/> Google IMA SDK tvOS 4.8.2 (exact version) |
| **Software requirements** | [Xcode 14.2](https://developer.apple.com/download/all/?q=xcode%2014.2) (includes Swift 5.7) <br /> [Git](https://git-scm.com/downloads) <br/> [Flowplayer OVP](https://app.flowplayer.com/) <br /> [Wowza Video](https://auth.wowza.com/login?onsuccess=https://video.wowza.com/en/manage) |

## Add the iOS SDK to your project

Once you've met all prerequisites, you can add the Wowza Flowplayer iOS SDK to your project and start developing. Install the SDK using the methods described in this section. The compiled framework and our example applications are available in this repository.

### Swift Package Manager

You can integrate the Wowza Flowplayer iOS SDK from Xcode using Swift Package Manager. To accomplish this task in Xcode, you need a personal access token in GitHub. You should also add your GitHub source control account from the Xcode menu, under **Settings > Accounts**.

1. With your Xcode project open, go to **File > Add Packages**.
2. Select **GitHub** from **Source Control Accounts**.
3. Enter this URL in the **Search or Enter Package URL** field:

    ```txt
    https://github.com/flowplayer/apple-sdk-releases
    ```

4. Select the appropriate dependency rule and project.
5. Click **Add Package**.
6. Xcode automatically verifies and fetches the SDK package.
7. Select the target where you plan to integrate the SDK.
8. Click **Add Package** to finalize. The Wowza Flowplayer iOS SDK is added and ready for use in your application. It appears under **Package Dependencies** in the Xcode Project Navigator.

### CocoaPods

You can also use the [CocoaPods](https://guides.cocoapods.org/) dependency manager to integrate the SDK into your projects. To use this approach, follow these steps.

1. Add the **FlowplayerSDK** framework to your Podfile:

    ```ruby
    platform :ios, '13.0'
    use_frameworks!

    target 'YourApp' do
      pod 'FlowplayerSDK', '~> 1.0.0'
    end
    ```

2. Install the SDK framework by running this command in your project directory:

    ```txt
    pod install
    ```

3. Open the **FlowplayerSDK.xcworkspace** file from your terminal and build your project in Xcode.

### Manual installation

If you prefer a more manual approach to add the SDK to your projects, see [Manual installation](https://developer.wowza.com/docs/wowza-flowplayer/sdks/apple/ios/getting-started/#manual-installation).

## Running Examples

This repository includes example projects for [iOS](https://github.com/flowplayer/apple-sdk-releases/tree/main/iOS%20Example) and [tvOS](https://github.com/flowplayer/apple-sdk-releases/tree/main/tvOS%20Example). You can explore these examples and integrate them into your own work.

To run the example apps included in this repository, you need an access token from Wowza Flowplayer or Wowza Video. This token allows the player to display content in your iOS or tvOS application. You can update your target's **Info.plist** file  with this token. You can also accomplish the same goal by setting the [FlowplayerSDK.current.accessToken](https://github.com/flowplayer/apple-sdk-releases/blob/main/iOS%20Example/Sources/App/AppDelegate.swift) property in the example app configurations.

## Contributing

We welcome contributions from the community! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.
