#!/bin/bash

# Check for arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided. First argument has to be version, e.g. '4.0.0'"
    exit 1
fi

# Assuming this script is executed from directory which contains Package.Swift
# take version (e.g. 4.0.0) as argument
# take checksum as argument
NEW_VERSION=$1
NEW_CHECKSUM=$2

echo "Updating Package.swift..."
echo "🔐 New checksum is: $NEW_CHECKSUM"

# Replace version information in package manifest
sed -E -i '' 's/let version = ".+"/let version = "'$NEW_VERSION\"/ Package.swift

# Replace checksum information in package manifest
sed -i -E "s/checksum: \".*\"/checksum: \"$NEW_CHECKSUM\"/" Package.swift

# print out package manifes for convenience reasons
echo "📜 New Package Manifest is:"
cat Package.swift

echo "💊 Updating FlowplayerSDK.podspec..."
sed -E -i '' 's/VERSION = ".+"/VERSION = "'$NEW_VERSION\"/ FlowplayerSDK.podspec

# Check if the file exists and delete it if it does
if [ -f "Package.swift-E" ]; then
    rm "Package.swift-E"
fi

