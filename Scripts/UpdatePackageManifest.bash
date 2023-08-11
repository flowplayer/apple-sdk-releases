#!/bin/bash

# Check for arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided. First argument has to be version, e.g. '4.0.0'"
    exit 1
fi

# Assuming this script is executed from directory which contains Package.Swift
# take version (e.g. 4.0.0) as argument
BINARY_NAME="FlowplayerSDK.zip"
NEW_VERSION=$1

# Download new zip file
curl -L -O https://github.com/flowplayer/apple-sdk-releases/releases/download/${NEW_VERSION}/${BINARY_NAME} --silent
echo "🗃️ Downloaded $BINARY_NAME"

# Calculate new checksum
NEW_CHECKSUM=$(swift package compute-checksum $BINARY_NAME)
echo "🔐 New checksum is: $NEW_CHECKSUM"

# Replace version information in package manifest
sed -E -i '' 's/let version = ".+"/let version = "'$NEW_VERSION\"/ FlowplayerSDK/Package.swift

# Replace checksum information in package manifest
sed -E -i '' 's/checksum: ".+"/checksum: "'$NEW_CHECKSUM\"/ FlowplayerSDK/Package.swift

# print out package manifes for convenience reasons
echo "📜 New Package Manifest is:"
cat FlowplayerSDK/Package.swift

# delete downloaded zip file
rm $BINARY_NAME