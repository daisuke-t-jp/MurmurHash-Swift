<img src="https://github.com/daisuke-t-jp/MurmurHash-Swift/blob/master/doc/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%2010.0+%20%7C%20macOS%2010.12+%20%7C%20tvOS%2012.0+-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Cocoapods](https://img.shields.io/cocoapods/v/MurmurHash-Swift.svg)](https://cocoapods.org/pods/MurmurHash-Swift)
[![Build Status](https://travis-ci.org/daisuke-t-jp/MurmurHash-Swift.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/MurmurHash-Swift)


# What is this?

**MurmurHash** framework in Swift.  
Framework include *x86_32, x86_128, x64_128* functions.  
  
Reference :
- [MurmurHash - Wikipedia](https://en.wikipedia.org/wiki/MurmurHash)


# Install
### Carthage
`github "daisuke-t-jp/MurmurHash-Swift"`

### CocoaPods
```
use_frameworks!

target 'target' do
pod 'MurmurHash-Swift'
end
```



# Usage

## Import framework

```swift
import MurmurHash_Swift
```


## Generate x86/32bit Hash
```swift
/**
 * Generate.
 */
// Generate hash from String.
let hash = MurmurHash3.x86_32("Hello World!")
print(String.init(format: "0x%x", hash)) // "0xdc09357d"

// Generate hash from [UInt8].
let hash = MurmurHash3.x86_32(Array("Hello World!".utf8))

// Generate hash from Data.
let hash = MurmurHash3.x86_32("Hello World!".data(using: .utf8)!)


/**
 * Using seed.
 */
let seed = 0x7fffffff

// Generate hash from String.
let hash = MurmurHash3.x86_32("Hello World!", seed: seed)
print(String.init(format: "0x%x", hash)) // "0xf98a8b8e"

// Generate hash from [UInt8].
let hash = MurmurHash3.x86_32(Array("Hello World!".utf8), seed: seed)

// Generate hash from Data.
let hash = MurmurHash3.x86_32("Hello World!".data(using: .utf8)!, seed: seed)
```



## Generate x86/128bit Hash
```swift
/**
 * Generate.
 */
// Generate hash from String.
let hash = MurmurHash3.x86_128("Hello World!")
print(String.init(format: "0x%x%x%x%x", hash.h1, hash.h2, hash.h3, hash.h4)) // "0x6bee9883eb1be4f59dfb7172ae3fbea9"

// Generate hash from [UInt8].
let hash = MurmurHash3.x86_128(Array("Hello World!".utf8))

// Generate hash from Data.
let hash = MurmurHash3.x86_128("Hello World!".data(using: .utf8)!)


/**
 * Using seed.
 */
let seed = 0x7fffffff

// Generate hash from String.
let hash = MurmurHash3.x86_128("Hello World!", seed: seed)
print(String.init(format: "0x%x%x%x%x", hash.h1, hash.h2, hash.h3, hash.h4)) // "0xa8c348436bb9375369e62d2b2cefbb56"

// Generate hash from [UInt8].
let hash = MurmurHash3.x86_128(Array("Hello World!".utf8), seed: seed)

// Generate hash from Data.
let hash = MurmurHash3.x86_128("Hello World!".data(using: .utf8)!, seed: seed)
```



## Generate x64/128bit Hash
```swift
/**
 * Generate.
 */
// Generate hash from String.
let hash = MurmurHash3.x64_128("Hello World!")
print(String.init(format: "0x%lx%lx", hash.h1, hash.h2)) // "0x80025454af3196b2e57813856f452fa6"

// Generate hash from [UInt8].
let hash = MurmurHash3.x64_128(Array("Hello World!".utf8))

// Generate hash from Data.
let hash = MurmurHash3.x64_128("Hello World!".data(using: .utf8)!)


/**
 * Using seed.
 */
let seed = 0x7fffffff

// Generate hash from String.
let hash = MurmurHash3.x64_128("Hello World!", seed: seed)
print(String.init(format: "0x%lx%lx", hash.h1, hash.h2)) // "0xa8c348436bb9375369e62d2b2cefbb56"

// Generate hash from [UInt8].
let hash = MurmurHash3.x64_128(Array("Hello World!".utf8), seed: seed)

// Generate hash from Data.
let hash = MurmurHash3.x64_128("Hello World!".data(using: .utf8)!, seed: seed)
```
