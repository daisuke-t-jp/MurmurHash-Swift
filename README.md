<img src="https://github.com/daisuke-t-jp/MurmurHash-Swift/blob/master/doc/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20Linux-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Cocoapods](https://img.shields.io/cocoapods/v/MurmurHash-Swift.svg)](https://cocoapods.org/pods/MurmurHash-Swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-green.svg)](https://github.com/apple/swift-package-manager)
[![Build Status](https://travis-ci.org/daisuke-t-jp/MurmurHash-Swift.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/MurmurHash-Swift)


# Introduction

**MurmurHash** framework in Swift.  
A framework includes MurmurHash3's x86_32/x86_128/x64_128 functions.  
  
Reference :
- [MurmurHash - Wikipedia](https://en.wikipedia.org/wiki/MurmurHash)


# Requirements
- Platforms
  - iOS 10.0+
  - macOS 10.12+
  - tvOS 12.0+
  - Linux
- Swift 4.2+


# Installation
## CocoaPods
```
use_frameworks!

target 'target' do
pod 'MurmurHash-Swift'
end
```

## Carthage
`github "daisuke-t-jp/MurmurHash-Swift"`

## Swift Package Manager
```swift
import PackageDescription

let package = Package(
    name: "YOUR_PACKAGE_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/daisuke-t-jp/MurmurHash-Swift.git", from: "1.0.0")
    ]
    targets: [
        .target(
            name: "YOUR_TARGET_NAME",
            dependencies: ["MurmurHash-Swift"]),
	]
)
```


# Usage

## Import framework

```swift
import MurmurHash_Swift
```

## Generate digest
```swift
let digest_x86_32 = MurmurHash3.x86_32("Hello World!") // if using seed, e.g. "MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff)"
// digest_x86_32 -> 0xdc09357d

let digest_x86_32_hex = MurmurHash3.x86_32Hex("Hello World!")
// digest_x86_32_hex -> "dc09357d"


let digest_x86_128 = MurmurHash3.x86_128("Hello World!") // if using seed, e.g. "MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)"
// digest_x86_128[0] -> 0x6bee9883
// digest_x86_128[1] -> 0xeb1be4f5
// digest_x86_128[2] -> 0x9dfb7172
// digest_x86_128[3] -> 0xae3fbea9

let digest_x86_128_hex = MurmurHash3.x86_128Hex("Hello World!")
// digest_x86_128_hex -> "6bee9883eb1be4f59dfb7172ae3fbea9"


let digest_x64_128 = MurmurHash3.x64_128("Hello World!") // if using seed, e.g. "MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)"
// digest_x64_128[0] -> 0x80025454af3196b2
// digest_x64_128[1] -> 0xe57813856f452fa6

let digest_x64_128_hex = MurmurHash3.x64_128Hex("Hello World!")
// digest_x64_128_hex -> "80025454af3196b2e57813856f452fa6"
```
