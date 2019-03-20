#!/bin/bash

rm -rf .build
rm -rf test.xcodeproj
rm -rf Package.resolved
swift run package-config
swift package generate-xcodeproj
swift run phase
swift run ignore

