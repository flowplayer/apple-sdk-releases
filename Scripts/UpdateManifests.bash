#!/bin/bash

# Check for arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided. First argument has to be version, e.g. '4.0.0'"
    exit 1
fi

# Assuming this script is executed from directory which contains Package.Swift
# Version (e.g. 4.0.0) as argument
NEW_VERSION=$1
# Checksum as argument
NEW_CHECKSUM=$2

echo "New checksum is: $NEW_CHECKSUM"
echo "New version is: $NEW_VERSION"

# Update Package.swift
echo "Updating Package.swift..."
sed -E -i '' 's/let version = ".+"/let version = "'$NEW_VERSION\"/ Package.swift
sed -i -E "s/checksum: \".*\"/checksum: \"$NEW_CHECKSUM\"/" Package.swift
echo "New Package.swift:"
cat Package.swift

# Update CocoaPods
echo "Updating FlowplayerSDK.podspec"
sed -E -i '' 's/VERSION = ".+"/VERSION = "'$NEW_VERSION\"/ FlowplayerSDK.podspec
echo "New FlowplayerSDK.podspec"
cat FlowplayerSDK.podspec

# Remove generated Package.swift-E
if [ -f "Package.swift-E" ]; then
    rm "Package.swift-E"
fi