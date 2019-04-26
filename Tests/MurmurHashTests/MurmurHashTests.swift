//
//  MurmurHashTests.swift
//  MurmurHashTests
//
//  Created by Daisuke T on 2019/02/06.
//  Copyright © 2019 MurmurHash. All rights reserved.
//

import XCTest
#if SWIFT_PACKAGE
@testable import MurmurHash_Swift
#else
@testable import MurmurHash
#endif

class MurmurHashTests: XCTestCase {
  
  // MARK: - Property
  static var allTests = [
    ("test_x86_32Overload", test_x86_32Overload),
    ("test_x86_128Overload", test_x86_128Overload),
    ("test_x64_128Overload", test_x64_128Overload),
    ("test_x86_32OneShot", test_x86_32OneShot),
    ("test_x86_32OneShotWithSeed", test_x86_32OneShotWithSeed),
    ("test_x86_128OneShot", test_x86_128OneShot),
    ("test_x86_128OneShotWithSeed", test_x86_128OneShotWithSeed),
    ("test_x64_128OneShot", test_x64_128OneShot),
    ("test_x64_128OneShotWithSeed", test_x64_128OneShotWithSeed),
    ("test_x86_32Update", test_x86_32Update),
    ("test_x86_32UpdateWithSeed", test_x86_32UpdateWithSeed),
    ("test_x86_128Update", test_x86_128Update),
    ("test_x86_128UpdateWithSeed", test_x86_128UpdateWithSeed),
    ("test_x64_128Update", test_x64_128Update),
    ("test_x64_128UpdateWithSeed", test_x64_128UpdateWithSeed),
    ("test_x86_32Reset", test_x86_32Reset),
    ("test_x86_128Reset", test_x86_128Reset),
    ("test_x64_128Reset", test_x64_128Reset),
    ("test_x86_32Copy", test_x86_32Copy),
    ("test_x86_128Copy", test_x86_128Copy),
    ("test_x64_128Copy", test_x64_128Copy),
    ("test_x86_32File", test_x86_32File),
    ("test_x86_32FileWithSeed", test_x86_32FileWithSeed),
    ("test_x86_128File", test_x86_128File),
    ("test_x86_128FileWithSeed", test_x86_128FileWithSeed),
    ("test_x64_128File", test_x64_128File),
    ("test_x64_128FileWithSeed", test_x64_128FileWithSeed),
  ]
  
  
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  
  // MARK: - Overload
  func test_x86_32Overload() {
    XCTAssertEqual(MurmurHash3.x86_32.digest("Hello World!"), MurmurHash3.x86_32.digest(Array("Hello World!".utf8)))
    XCTAssertEqual(MurmurHash3.x86_32.digest("Hello World!"), MurmurHash3.x86_32.digest("Hello World!".data(using: .utf8)!))
  }
  
  func test_x86_128Overload() {
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World!"), MurmurHash3.x86_128.digest(Array("Hello World!".utf8)))
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World!"), MurmurHash3.x86_128.digest("Hello World!".data(using: .utf8)!))
  }
  
  func test_x64_128Overload() {
    XCTAssertEqual(MurmurHash3.x64_128.digest("Hello World!"), MurmurHash3.x64_128.digest(Array("Hello World!".utf8)))
    XCTAssertEqual(MurmurHash3.x64_128.digest("Hello World!"), MurmurHash3.x64_128.digest("Hello World!".data(using: .utf8)!))
  }
  
  
  // MARK: - OneShot
  func test_x86_32OneShot() {
    XCTAssertEqual(MurmurHash3.x86_32.digest(""), 0x00000000)
    XCTAssertEqual(MurmurHash3.x86_32.digestHex(""), "00000000")
    
    XCTAssertEqual(MurmurHash3.x86_32.digest("Hello World! Hello World!"), 0x0be480fc)
    XCTAssertEqual(MurmurHash3.x86_32.digestHex("Hello World! Hello World!").lowercased(), "0be480fc")
  }
  
  func test_x86_32OneShotWithSeed() {
    XCTAssertEqual(MurmurHash3.x86_32.digest("", seed: 0x7fffffff), 0xf9cc0ea8)
    XCTAssertEqual(MurmurHash3.x86_32.digestHex("", seed: 0x7fffffff), "f9cc0ea8")
    
    XCTAssertEqual(MurmurHash3.x86_32.digest("Hello World! Hello World!", seed: 0x7fffffff), 0x47fcc800)
    XCTAssertEqual(MurmurHash3.x86_32.digestHex("Hello World! Hello World!", seed: 0x7fffffff).lowercased(), "47fcc800")
  }
  
  func test_x86_128OneShot() {
    XCTAssertEqual(MurmurHash3.x86_128.digest("")[0], 0x00000000)
    XCTAssertEqual(MurmurHash3.x86_128.digest("")[1], 0x00000000)
    XCTAssertEqual(MurmurHash3.x86_128.digest("")[2], 0x00000000)
    XCTAssertEqual(MurmurHash3.x86_128.digest("")[3], 0x00000000)
    XCTAssertEqual(MurmurHash3.x86_128.digestHex(""), "00000000000000000000000000000000")
    
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!")[0], 0x86163d2b)
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!")[1], 0x245b8ee2)
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!")[2], 0x3c4d0560)
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!")[3], 0x24166d77)
    XCTAssertEqual(MurmurHash3.x86_128.digestHex("Hello World! Hello World!").lowercased(), "86163d2b245b8ee23c4d056024166d77")
  }
  
  func test_x86_128OneShotWithSeed() {
    XCTAssertEqual(MurmurHash3.x86_128.digest("", seed: 0x7fffffff)[0], 0xc129af26)
    XCTAssertEqual(MurmurHash3.x86_128.digest("", seed: 0x7fffffff)[1], 0x3e0227f3)
    XCTAssertEqual(MurmurHash3.x86_128.digest("", seed: 0x7fffffff)[2], 0x3e0227f3)
    XCTAssertEqual(MurmurHash3.x86_128.digest("", seed: 0x7fffffff)[3], 0x3e0227f3)
    XCTAssertEqual(MurmurHash3.x86_128.digestHex("", seed: 0x7fffffff), "c129af263e0227f33e0227f33e0227f3")
    
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!", seed: 0x7fffffff)[0], 0xd1ab28e6)
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!", seed: 0x7fffffff)[1], 0xf4fc514c)
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!", seed: 0x7fffffff)[2], 0x5e0df753)
    XCTAssertEqual(MurmurHash3.x86_128.digest("Hello World! Hello World!", seed: 0x7fffffff)[3], 0xb015261f)
    XCTAssertEqual(MurmurHash3.x86_128.digestHex("Hello World! Hello World!", seed: 0x7fffffff).lowercased(), "d1ab28e6f4fc514c5e0df753b015261f")
  }
  
  func test_x64_128OneShot() {
    XCTAssertEqual(MurmurHash3.x64_128.digest("")[0], 0x0000000000000000)
    XCTAssertEqual(MurmurHash3.x64_128.digest("")[1], 0x0000000000000000)
    XCTAssertEqual(MurmurHash3.x64_128.digestHex(""), "00000000000000000000000000000000")
    
    XCTAssertEqual(MurmurHash3.x64_128.digest("Hello World! Hello World!")[0], 0xe881a28e49269b1e)
    XCTAssertEqual(MurmurHash3.x64_128.digest("Hello World! Hello World!")[1], 0x8d0d724eecb72e66)
    XCTAssertEqual(MurmurHash3.x64_128.digestHex("Hello World! Hello World!").lowercased(), "e881a28e49269b1e8d0d724eecb72e66")
  }
  
  func test_x64_128OneShotWithSeed() {
    XCTAssertEqual(MurmurHash3.x64_128.digest("", seed: 0x7fffffff)[0], 0x656ac7570e166c3f)
    XCTAssertEqual(MurmurHash3.x64_128.digest("", seed: 0x7fffffff)[1], 0xc34c2ca1ed468e40)
    XCTAssertEqual(MurmurHash3.x64_128.digestHex("", seed: 0x7fffffff), "656ac7570e166c3fc34c2ca1ed468e40")
    
    XCTAssertEqual(MurmurHash3.x64_128.digest("Hello World! Hello World!", seed: 0x7fffffff)[0], 0x6028586a8c3df476)
    XCTAssertEqual(MurmurHash3.x64_128.digest("Hello World! Hello World!", seed: 0x7fffffff)[1], 0xfbd535aec6551aab)
    XCTAssertEqual(MurmurHash3.x64_128.digestHex("Hello World! Hello World!", seed: 0x7fffffff).lowercased(), "6028586a8c3df476fbd535aec6551aab")
  }
  
  
  
  // MARK: - Update
  func test_x86_32Update() {
    do {
      let mmh = MurmurHash3.x86_32()
      XCTAssertEqual(mmh.digest(), 0x00000000)
      XCTAssertEqual(mmh.digestHex(), "00000000")
    }
    
    do {
      let mmh = MurmurHash3.x86_32()
      mmh.update("H")
      mmh.update("el")
      mmh.update("lo W")
      mmh.update("orld! He")
      mmh.update("llo World!")
      XCTAssertEqual(mmh.digest(), 0x0be480fc)
      XCTAssertEqual(mmh.digestHex().lowercased(), "0be480fc")
    }
  }
  
  func test_x86_32UpdateWithSeed() {
    do {
      let mmh = MurmurHash3.x86_32(0x7fffffff)
      XCTAssertEqual(mmh.digest(), 0xf9cc0ea8)
      XCTAssertEqual(mmh.digestHex(), "f9cc0ea8")
    }
    
    do {
      let mmh = MurmurHash3.x86_32(0x7fffffff)
      mmh.update("H")
      mmh.update("el")
      mmh.update("lo W")
      mmh.update("orld! He")
      mmh.update("llo World!")
      XCTAssertEqual(mmh.digest(), 0x47fcc800)
      XCTAssertEqual(mmh.digestHex().lowercased(), "47fcc800")
    }
  }
  
  func test_x86_128Update() {
    do {
      let mmh = MurmurHash3.x86_128()
      XCTAssertEqual(mmh.digest()[0], 0x00000000)
      XCTAssertEqual(mmh.digest()[1], 0x00000000)
      XCTAssertEqual(mmh.digest()[2], 0x00000000)
      XCTAssertEqual(mmh.digest()[3], 0x00000000)
      XCTAssertEqual(mmh.digestHex(), "00000000000000000000000000000000")
    }
    
    do {
      let mmh = MurmurHash3.x86_128()
      mmh.update("H")
      mmh.update("el")
      mmh.update("lo W")
      mmh.update("orld! He")
      mmh.update("llo World!")
      XCTAssertEqual(mmh.digest()[0], 0x86163d2b)
      XCTAssertEqual(mmh.digest()[1], 0x245b8ee2)
      XCTAssertEqual(mmh.digest()[2], 0x3c4d0560)
      XCTAssertEqual(mmh.digest()[3], 0x24166d77)
      XCTAssertEqual(mmh.digestHex().lowercased(), "86163d2b245b8ee23c4d056024166d77")
    }
  }
  
  func test_x86_128UpdateWithSeed() {
    do {
      let mmh = MurmurHash3.x86_128(0x7fffffff)
      XCTAssertEqual(mmh.digest()[0], 0xc129af26)
      XCTAssertEqual(mmh.digest()[1], 0x3e0227f3)
      XCTAssertEqual(mmh.digest()[2], 0x3e0227f3)
      XCTAssertEqual(mmh.digest()[3], 0x3e0227f3)
      XCTAssertEqual(mmh.digestHex(), "c129af263e0227f33e0227f33e0227f3")
    }
    
    do {
      let mmh = MurmurHash3.x86_128(0x7fffffff)
      mmh.update("H")
      mmh.update("el")
      mmh.update("lo W")
      mmh.update("orld! He")
      mmh.update("llo World!")
      XCTAssertEqual(mmh.digest()[0], 0xd1ab28e6)
      XCTAssertEqual(mmh.digest()[1], 0xf4fc514c)
      XCTAssertEqual(mmh.digest()[2], 0x5e0df753)
      XCTAssertEqual(mmh.digest()[3], 0xb015261f)
      XCTAssertEqual(mmh.digestHex().lowercased(), "d1ab28e6f4fc514c5e0df753b015261f")
    }
  }
  
  func test_x64_128Update() {
    do {
      let mmh = MurmurHash3.x64_128()
      XCTAssertEqual(mmh.digest()[0], 0x0000000000000000)
      XCTAssertEqual(mmh.digest()[1], 0x0000000000000000)
      XCTAssertEqual(mmh.digestHex(), "00000000000000000000000000000000")
    }
    
    do {
      let mmh = MurmurHash3.x64_128()
      mmh.update("H")
      mmh.update("el")
      mmh.update("lo W")
      mmh.update("orld! He")
      mmh.update("llo World!")
      XCTAssertEqual(mmh.digest()[0], 0xe881a28e49269b1e)
      XCTAssertEqual(mmh.digest()[1], 0x8d0d724eecb72e66)
      XCTAssertEqual(mmh.digestHex().lowercased(), "e881a28e49269b1e8d0d724eecb72e66")
    }
  }
  
  func test_x64_128UpdateWithSeed() {
    do {
      let mmh = MurmurHash3.x64_128(0x7fffffff)
      XCTAssertEqual(mmh.digest()[0], 0x656ac7570e166c3f)
      XCTAssertEqual(mmh.digest()[1], 0xc34c2ca1ed468e40)
      XCTAssertEqual(mmh.digestHex(), "656ac7570e166c3fc34c2ca1ed468e40")
    }
    
    do {
      let mmh = MurmurHash3.x64_128(0x7fffffff)
      mmh.update("H")
      mmh.update("el")
      mmh.update("lo W")
      mmh.update("orld! He")
      mmh.update("llo World!")
      XCTAssertEqual(mmh.digest()[0], 0x6028586a8c3df476)
      XCTAssertEqual(mmh.digest()[1], 0xfbd535aec6551aab)
      XCTAssertEqual(mmh.digestHex().lowercased(), "6028586a8c3df476fbd535aec6551aab")
    }
  }
  
  
  
  // MARK: - Reset
  func test_x86_32Reset() {
    let seed = UInt32(0x7fffffff)
    let mmh = MurmurHash3.x86_32()
    
    mmh.update("123456789ABCDEF")
    mmh.reset()
    XCTAssertEqual(mmh.digest(), MurmurHash3.x86_32().digest())
    
    mmh.update("123456789ABCDEF")
    mmh.seed = seed  // Reset when setting seed.
    XCTAssertEqual(mmh.digest(), MurmurHash3.x86_32(seed).digest())
  }
  
  func test_x86_128Reset() {
    let seed = UInt32(0x7fffffff)
    let mmh = MurmurHash3.x86_128()
    
    mmh.update("123456789ABCDEF")
    mmh.reset()
    XCTAssertEqual(mmh.digest(), MurmurHash3.x86_128().digest())
    
    mmh.update("123456789ABCDEF")
    mmh.seed = seed  // Reset when setting seed.
    XCTAssertEqual(mmh.digest(), MurmurHash3.x86_128(seed).digest())
  }
  
  func test_x64_128Reset() {
    let seed = UInt32(0x7fffffff)
    let mmh = MurmurHash3.x64_128()
    
    mmh.update("123456789ABCDEF")
    mmh.reset()
    XCTAssertEqual(mmh.digest(), MurmurHash3.x64_128().digest())
    
    mmh.update("123456789ABCDEF")
    mmh.seed = seed  // Reset when setting seed.
    XCTAssertEqual(mmh.digest(), MurmurHash3.x64_128(seed).digest())
  }
  
  
  
  // MARK: - Copy
  func test_x86_32Copy() {
    do {
      let mmh = MurmurHash3.x86_32()
      let mmh2 = mmh
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
    }
    
    do {
      let mmh = MurmurHash3.x86_32(0x7fffffff)
      let mmh2 = mmh
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
    }
  }
  
  func test_x86_128Copy() {
    do {
      let mmh = MurmurHash3.x86_128()
      let mmh2 = mmh
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
    }
    
    do {
      let mmh = MurmurHash3.x86_128(0x7fffffff)
      let mmh2 = mmh
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
    }
  }
  
  func test_x64_128Copy() {
    do {
      let mmh = MurmurHash3.x64_128()
      let mmh2 = mmh
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
    }
    
    do {
      let mmh = MurmurHash3.x64_128(0x7fffffff)
      let mmh2 = mmh
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
      
      mmh.update("123456789ABCDEF")
      XCTAssertEqual(mmh.digest(), mmh2.digest())
    }
  }
  
  
  
  // MARK: - File
  func test_x86_32File() {
    #if SWIFT_PACKAGE
    print("SwiftPM-Building skipped UnitTest that used resources.")
    #else
    let mmh = MurmurHash3.x86_32()
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      mmh.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    XCTAssertEqual(mmh.digest(), 0xcae14481)
    #endif
  }
  
  func test_x86_32FileWithSeed() {
    #if SWIFT_PACKAGE
    print("SwiftPM-Building skipped UnitTest that used resources.")
    #else
    let mmh = MurmurHash3.x86_32(0x7fffffff)
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      mmh.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    XCTAssertEqual(mmh.digest(), 0xf9eb2993)
    #endif
  }
  
  func test_x86_128File() {
    #if SWIFT_PACKAGE
    print("SwiftPM-Building skipped UnitTest that used resources.")
    #else
    let mmh = MurmurHash3.x86_128()
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      mmh.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    XCTAssertEqual(mmh.digestHex().lowercased(), "f3d9739244076beaaaa983c7cc4c7251")
    #endif
  }
  
  func test_x86_128FileWithSeed() {
    #if SWIFT_PACKAGE
    print("SwiftPM-Building skipped UnitTest that used resources.")
    #else
    let mmh = MurmurHash3.x86_128(0x7fffffff)
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      mmh.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    XCTAssertEqual(mmh.digestHex().lowercased(), "665293173c66d76ced7111d2ec5190a3")
    #endif
  }
  
  func test_x64_128File() {
    #if SWIFT_PACKAGE
    print("SwiftPM-Building skipped UnitTest that used resources.")
    #else
    let mmh = MurmurHash3.x64_128()
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      mmh.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    XCTAssertEqual(mmh.digestHex().lowercased(), "ef12617f3e2a5f9a44b3598f2e09cd50")
    #endif
  }
  
  func test_x64_128FileWithSeed() {
    #if SWIFT_PACKAGE
    print("SwiftPM-Building skipped UnitTest that used resources.")
    #else
    let mmh = MurmurHash3.x64_128(0x7fffffff)
    
    let bundle = Bundle(for: type(of: self))
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      mmh.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    XCTAssertEqual(mmh.digestHex().lowercased(), "c9e3c738ae105764b1d34bb24aa326c4")
    #endif
  }
}
