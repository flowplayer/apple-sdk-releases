require 'json'

VERSION = "4.6.1"
SOURCE_URL = "https://github.com/flowplayer/apple-sdk-releases/releases/download/#{VERSION}/FlowplayerSDK.zip"

Pod::Spec.new do |spec|

  spec.name                  = "FlowplayerSDK"
  spec.version               = VERSION
  spec.summary               = "Official Flowplayer SDK designed for the Apple eco-system."
  spec.homepage              = "https://wowza.com"
  spec.license               = { :type => "Wowza Commercial License", :file => "LICENSE" }
  spec.author                = "Wowza LLC"
  spec.platforms             = { :ios => "14.0", :tvos => "14.0" }
  spec.swift_version         = "5.0"
  spec.source                = { :http => SOURCE_URL }
  spec.vendored_frameworks   = "FlowplayerSDK.xcframework"

end
