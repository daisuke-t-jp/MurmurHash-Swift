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
		("test_x86_32", test_x86_32),
		("test_x86_32_seed", test_x86_32_seed),
		("test_x86_32_file", test_x86_32_file),
		("test_x86_128", test_x86_128),
		("test_x86_128_seed", test_x86_128_seed),
		("test_x86_128_file", test_x86_128_file),
		("test_x64_128", test_x64_128),
		("test_x64_128_seed", test_x64_128_seed),
		("test_x64_128_file", test_x64_128_file),
		]
	
	
	
	override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	
	
	// MARK: - Overload
	func test_overload() {
		
		// x86_32
		XCTAssertEqual(MurmurHash3.x86_32("Hello World!"), MurmurHash3.x86_32(Array("Hello World!".utf8)))
		XCTAssertEqual(MurmurHash3.x86_32("Hello World!"), MurmurHash3.x86_32("Hello World!".data(using: .utf8)!))

		// x86_32 with seed
		XCTAssertEqual(MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff), MurmurHash3.x86_32(Array("Hello World!".utf8), seed: 0x7fffffff))
		XCTAssertEqual(MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff), MurmurHash3.x86_32("Hello World!".data(using: .utf8)!, seed: 0x7fffffff))
		
		
		// x86_128
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[0], MurmurHash3.x86_128(Array("Hello World!".utf8))[0])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[1], MurmurHash3.x86_128(Array("Hello World!".utf8))[1])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[2], MurmurHash3.x86_128(Array("Hello World!".utf8))[2])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[3], MurmurHash3.x86_128(Array("Hello World!".utf8))[3])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[0], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!)[0])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[1], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!)[1])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[2], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!)[2])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!")[3], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!)[3])

		// x86_32 with seed
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[0], MurmurHash3.x86_128(Array("Hello World!".utf8), seed: 0x7fffffff)[0])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[1], MurmurHash3.x86_128(Array("Hello World!".utf8), seed: 0x7fffffff)[1])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[2], MurmurHash3.x86_128(Array("Hello World!".utf8), seed: 0x7fffffff)[2])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[3], MurmurHash3.x86_128(Array("Hello World!".utf8), seed: 0x7fffffff)[3])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[0], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!, seed: 0x7fffffff)[0])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[1], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!, seed: 0x7fffffff)[1])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[2], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!, seed: 0x7fffffff)[2])
		XCTAssertEqual(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[3], MurmurHash3.x86_128("Hello World!".data(using: .utf8)!, seed: 0x7fffffff)[3])
		
		
		// x64_128
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!")[0], MurmurHash3.x64_128(Array("Hello World!".utf8))[0])
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!")[1], MurmurHash3.x64_128(Array("Hello World!".utf8))[1])
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!")[0], MurmurHash3.x64_128("Hello World!".data(using: .utf8)!)[0])
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!")[1], MurmurHash3.x64_128("Hello World!".data(using: .utf8)!)[1])

		// x64_128 with seed
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[0], MurmurHash3.x64_128(Array("Hello World!".utf8), seed: 0x7fffffff)[0])
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[1], MurmurHash3.x64_128(Array("Hello World!".utf8), seed: 0x7fffffff)[1])
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[0], MurmurHash3.x64_128("Hello World!".data(using: .utf8)!, seed: 0x7fffffff)[0])
		XCTAssertEqual(MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[1], MurmurHash3.x64_128("Hello World!".data(using: .utf8)!, seed: 0x7fffffff)[1])
	}
	
	
	// MARK: - Hex
	func test_hex() {
		XCTAssertEqual(MurmurHash3.x86_32Hex("Hello World!").uppercased(), String.init(format: "%08X", MurmurHash3.x86_32("Hello World!")))
		XCTAssertEqual(MurmurHash3.x86_32Hex("Hello World!", seed: 0x7fffffff).uppercased(), String.init(format: "%08X", MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff)).uppercased())

		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World!").uppercased(), String.init(format: "%08X%08X%08X%08X",
																							  MurmurHash3.x86_128("Hello World!")[0],
																							  MurmurHash3.x86_128("Hello World!")[1],
																							  MurmurHash3.x86_128("Hello World!")[2],
																							  MurmurHash3.x86_128("Hello World!")[3]))
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World!", seed: 0x7fffffff).uppercased(), String.init(format: "%08X%08X%08X%08X",
																												MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[0],
																												MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[1],
																												MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[2],
																												MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[3]))

		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World!").uppercased(), String.init(format: "%016lX%016lX",
																							  MurmurHash3.x64_128("Hello World!")[0],
																							  MurmurHash3.x64_128("Hello World!")[1]))
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World!", seed: 0x7fffffff).uppercased(), String.init(format: "%016lX%016lX",
																												MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[0],
																												MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[1]))
	}
	
	
	// MARK: - x86_32
    func test_x86_32() {
		XCTAssertEqual(MurmurHash3.x86_32(""), 0x00000000)
		XCTAssertEqual(MurmurHash3.x86_32("H"), 0x407f6809)
		XCTAssertEqual(MurmurHash3.x86_32("He"), 0x3be5d8d4)
		XCTAssertEqual(MurmurHash3.x86_32("Hel"), 0xc8077ff4)
		XCTAssertEqual(MurmurHash3.x86_32("Hell"), 0x122cd931)
		XCTAssertEqual(MurmurHash3.x86_32("Hello"), 0x12da77c8)
		XCTAssertEqual(MurmurHash3.x86_32("Hello "), 0x1675bc3d)
		XCTAssertEqual(MurmurHash3.x86_32("Hello W"), 0x861e00fd)
		XCTAssertEqual(MurmurHash3.x86_32("Hello Wo"), 0x7e8cd30d)
		XCTAssertEqual(MurmurHash3.x86_32("Hello Wor"), 0xdb9a67a0)
		XCTAssertEqual(MurmurHash3.x86_32("Hello Worl"), 0x744de675)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World"), 0x197683ce)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World!"), 0xdc09357d)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! "), 0xa4290409)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! H"), 0x37705ad1)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! He"), 0xeae1424d)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hel"), 0x8ee885ed)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hell"), 0xb358fe40)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello"), 0x18ccc342)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello "), 0x8014041f)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello W"), 0x51fe306b)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello Wo"), 0xc4fc0856)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello Wor"), 0x3be80715)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello Worl"), 0x3a4235ef)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World"), 0xd6a558d2)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World!"), 0xbe480fc)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! "), 0x2ebfb07b)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! H"), 0x5c3be97c)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! He"), 0x9b1b4ab8)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hel"), 0x5a3a80d)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hell"), 0xe71278b6)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello"), 0x93f764ad)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello "), 0xcc58a5e2)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello W"), 0xe0fb50b)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello Wo"), 0xa61aaf9c)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello Wor"), 0xf7e33af3)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello Worl"), 0x40a0f31)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello World"), 0x1482ae00)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello World!"), 0x7e69caf)
		XCTAssertEqual(MurmurHash3.x86_32("メ"), 0xe782f64e)
		XCTAssertEqual(MurmurHash3.x86_32("メロ"), 0xfcf71bbf)
		XCTAssertEqual(MurmurHash3.x86_32("メロス"), 0x505ef550)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは"), 0xba921e0c)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激"), 0x7f477244)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒"), 0xb36c3b80)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒し"), 0x64a0499d)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した"), 0xed1ba65)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。"), 0xcf51463f)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必"), 0x6c8b61ba)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず"), 0xfb9028b7)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、"), 0xedb03bba)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、か"), 0xcfe951e6)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの"), 0xa4ba3f5a)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪"), 0x920742b2)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智"), 0x5b4d6308)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴"), 0x7d16c4e)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐"), 0x7ba0a512)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の"), 0x5c203c6c)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王"), 0x51dea28f)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を"), 0x45894cdb)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除"), 0x51cbe598)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除か"), 0x1d4521c7)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かな"), 0x30ca595c)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけ"), 0x9eb5d852)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけれ"), 0xab8c1fd8)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければ"), 0xafe8d02a)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければな"), 0x664b1c00)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければなら"), 0xbe0c58db)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬ"), 0x33f09b9)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと"), 0x6c9063e4)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決"), 0x44208555)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意"), 0xad35fa58)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意し"), 0xaaef12d6)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した"), 0x342ee5b)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。"), 0xa7a18dc8)
	}
	
	func test_x86_32_seed() {
		XCTAssertEqual(MurmurHash3.x86_32("", seed: 0x7fffffff), 0xf9cc0ea8)
		XCTAssertEqual(MurmurHash3.x86_32("H", seed: 0x7fffffff), 0x52067a84)
		XCTAssertEqual(MurmurHash3.x86_32("He", seed: 0x7fffffff), 0xdad0cd8d)
		XCTAssertEqual(MurmurHash3.x86_32("Hel", seed: 0x7fffffff), 0xd9ccf8c3)
		XCTAssertEqual(MurmurHash3.x86_32("Hell", seed: 0x7fffffff), 0x5e4fc438)
		XCTAssertEqual(MurmurHash3.x86_32("Hello", seed: 0x7fffffff), 0x496e26a1)
		XCTAssertEqual(MurmurHash3.x86_32("Hello ", seed: 0x7fffffff), 0xe639ffc1)
		XCTAssertEqual(MurmurHash3.x86_32("Hello W", seed: 0x7fffffff), 0x71be9a65)
		XCTAssertEqual(MurmurHash3.x86_32("Hello Wo", seed: 0x7fffffff), 0xda572088)
		XCTAssertEqual(MurmurHash3.x86_32("Hello Wor", seed: 0x7fffffff), 0xf4bb8b35)
		XCTAssertEqual(MurmurHash3.x86_32("Hello Worl", seed: 0x7fffffff), 0xc0c26ccc)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World", seed: 0x7fffffff), 0xf53f651c)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff), 0xf98a8b8e)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! ", seed: 0x7fffffff), 0x33ba4ced)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! H", seed: 0x7fffffff), 0xaa1a19aa)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! He", seed: 0x7fffffff), 0xfedc4a52)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hel", seed: 0x7fffffff), 0xa558f6eb)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hell", seed: 0x7fffffff), 0x36ca699d)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello", seed: 0x7fffffff), 0x72f3f42c)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello ", seed: 0x7fffffff), 0x452bca46)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello W", seed: 0x7fffffff), 0xff0dfe83)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello Wo", seed: 0x7fffffff), 0x6d340022)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello Wor", seed: 0x7fffffff), 0x3f5df9f2)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello Worl", seed: 0x7fffffff), 0xf438ccc4)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World", seed: 0x7fffffff), 0x858bec97)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World!", seed: 0x7fffffff), 0x47fcc800)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! ", seed: 0x7fffffff), 0x5abd793)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! H", seed: 0x7fffffff), 0x608e84f5)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! He", seed: 0x7fffffff), 0x1abc31aa)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hel", seed: 0x7fffffff), 0x10254abf)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hell", seed: 0x7fffffff), 0x7ee66698)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello", seed: 0x7fffffff), 0x78e938d4)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello ", seed: 0x7fffffff), 0x12b7bdaa)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello W", seed: 0x7fffffff), 0x4dba8730)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello Wo", seed: 0x7fffffff), 0x6e6095ff)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello Wor", seed: 0x7fffffff), 0x2f6a2507)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello Worl", seed: 0x7fffffff), 0x9267978a)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello World", seed: 0x7fffffff), 0xc7d6009)
		XCTAssertEqual(MurmurHash3.x86_32("Hello World! Hello World! Hello World!", seed: 0x7fffffff), 0xf77bb8d0)
		XCTAssertEqual(MurmurHash3.x86_32("メ", seed: 0x7fffffff), 0xd6b834c8)
		XCTAssertEqual(MurmurHash3.x86_32("メロ", seed: 0x7fffffff), 0xfdf88951)
		XCTAssertEqual(MurmurHash3.x86_32("メロス", seed: 0x7fffffff), 0xf621e9b2)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは", seed: 0x7fffffff), 0xdfdc597a)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激", seed: 0x7fffffff), 0x524d6284)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒", seed: 0x7fffffff), 0xdd077149)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒し", seed: 0x7fffffff), 0xf7a35869)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した", seed: 0x7fffffff), 0xe2ca1905)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。", seed: 0x7fffffff), 0xa33595a4)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必", seed: 0x7fffffff), 0x25a954d5)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず", seed: 0x7fffffff), 0xcb6ce0a6)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、", seed: 0x7fffffff), 0xf6c78c74)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、か", seed: 0x7fffffff), 0xc5ae5c55)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの", seed: 0x7fffffff), 0xe6c53e3)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪", seed: 0x7fffffff), 0x689f2961)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智", seed: 0x7fffffff), 0xeed08cae)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴", seed: 0x7fffffff), 0x3cc5dd77)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐", seed: 0x7fffffff), 0xe89de7ba)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の", seed: 0x7fffffff), 0xb78af695)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王", seed: 0x7fffffff), 0x3aff212c)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を", seed: 0x7fffffff), 0x3c3984c3)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除", seed: 0x7fffffff), 0x292ab73a)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除か", seed: 0x7fffffff), 0xe7365126)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かな", seed: 0x7fffffff), 0xb3cac03d)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけ", seed: 0x7fffffff), 0x4982639)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけれ", seed: 0x7fffffff), 0x2a468299)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければ", seed: 0x7fffffff), 0x4ee66b5e)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければな", seed: 0x7fffffff), 0xb757b178)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければなら", seed: 0x7fffffff), 0x54d0d5fa)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬ", seed: 0x7fffffff), 0x6d9491a9)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと", seed: 0x7fffffff), 0xe787246d)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決", seed: 0x7fffffff), 0xa320c6e8)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意", seed: 0x7fffffff), 0x409958f5)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意し", seed: 0x7fffffff), 0x11ad4d29)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した", seed: 0x7fffffff), 0xcc64b40b)
		XCTAssertEqual(MurmurHash3.x86_32("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。", seed: 0x7fffffff), 0xea95d42e)
	}
	
	func test_x86_32_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		XCTAssertEqual(MurmurHash3.x86_32(data), 0xcae14481)
		XCTAssertEqual(MurmurHash3.x86_32(data, seed: 0x7fffffff), 0xf9eb2993)
		#endif
	}
	

	
	// MARK: - x86_128
	func test_x86_128() {
		XCTAssertEqual(MurmurHash3.x86_128Hex(""), "00000000000000000000000000000000")
		XCTAssertEqual(MurmurHash3.x86_128Hex("H"), "f69feb5df45637a0f45637a0f45637a0")
		XCTAssertEqual(MurmurHash3.x86_128Hex("He"), "47f82b373b8fc7283b8fc7283b8fc728")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hel"), "7b0cd2cdcc2b995ccc2b995ccc2b995c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hell"), "7f771597e65bee6ae65bee6ae65bee6a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello"), "2360ae465e6336c6ad45b3f4ad45b3f4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello "), "497dc9d9b73bad59a57b7235a57b7235")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello W"), "3d021fe8d111dc31b6345ff3b6345ff3")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello Wo"), "db37ce0fe9a99ae0da8c411bda8c411b")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello Wor"), "107e2665706ff8b8eb00bf34e910bf63")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello Worl"), "2444bd95337fb2193d57dfac56dfdf0c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World"), "92cafa6a59653c6540fffff00b3beb9c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World!"), "6bee9883eb1be4f59dfb7172ae3fbea9")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! "), "c85c2fe13e579f88205695c8120178a3")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! H"), "aaadb4452b35ce375a481289ecaa84fe")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! He"), "784f7f08ab145b43cf27d08dc5413b50")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hel"), "82475db0161f88d8850474822a76794a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hell"), "a0cf95de87e61640ad45f08dc508c90a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello"), "453fc5363af752fbaa52e054540a402c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello "), "16e0ea8a87dc1e19068ba7919c38d718")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello W"), "a1bb3aeeb021f26a8d88a161040ada06")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello Wo"), "9fed48e5144ba009b58d3d34b62daee2")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello Wor"), "5e0bfa86a6c2fe4b16a426fc9c59806a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello Worl"), "a6ab4d82ed6fbf3f627af123264aa386")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World"), "776c2a21a491f2be85e490296ce4db25")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World!"), "86163d2b245b8ee23c4d056024166d77")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! "), "e9c90b4601d053dc9fb456143a9a7aad")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! H"), "1f21c189e59ba8379559e980acb9cad8")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! He"), "846027381e604d1d88f1ce28caafed7d")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hel"), "9ad096e1712df56be32adefb3cf31988")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hell"), "bae66e9de4b7bfa9ad918ed5b8694d0d")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello"), "1f806c1c9e417e08074fe5e25f3d2e00")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello "), "4855a598c76f875e7760fe307dcc7b58")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello W"), "27294dbafc42c30f0321c9080f55d4be")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello Wo"), "e63975239102cb333dc5ae42c304eaa7")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello Wor"), "39ac02d0185658e57e1daf6b7b1ccf52")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello Worl"), "436b1e30e43564f7ad455aa64d1f128a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello World"), "1c95a3f7906f972c94ce43d912a4eebc")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello World!"), "0097c20b59c7de4e21bf270576dcfc2f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メ"), "6fa5c4ad8756ef5c8756ef5c8756ef5c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロ"), "c2d1e50add88ceacd2e42bd3d2e42bd3")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロス"), "dcfa2df52a3c5ab9d74d6d304e537d23")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは"), "8d560049dbf2279ad4419805533fd567")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激"), "e0de0a4c08c5090bcf2fd9f85cc26bea")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒"), "f1f2bd9fdbc3344ca763431d17ef4fc6")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒し"), "30bdbe4addaf117141b3bc1736790341")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した"), "f98668d0c1c656582d35b90511938718")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。"), "d518bf44b2ced5f96d0e4a3c89c5230a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必"), "a8b5b7e7b4c0e272089aeaac013929d6")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず"), "20b46c6280886cc0030385f326baa825")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、"), "00a576b3d798a1eed80c9cc0d5c29db1")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、か"), "74494bde8d3585b53da6f36624c5e0a0")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの"), "1d028a63972c672b69df633a4bf21e2e")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪"), "890023ea402a56a02f09f13edbf3db48")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智"), "03964b0ac3b3af3b33abcc6eb0bc262a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴"), "555e6dc46da0cb8a8691ca26843222a4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐"), "a0144b00499eb44d4b81f4a1b7634afe")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の"), "85ac8bab897f34ab3275ae0cfb9ef51b")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王"), "1a55a7bab88c096fdb676afcfe45394f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を"), "3909aba427dd85c8a1ac2ae20415bfa8")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除"), "c397b66ddb4d80e46ede6282f94f22e0")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除か"), "e13b316523fd6d8f68499306a7e938c9")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かな"), "da4e550467493b468a1971ac6f224c42")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけ"), "af7c3f0af1f675d6bbd200d42503528f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけれ"), "c4c52c070d1478765a2f8057e3587fc4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければ"), "89e6870daa19944ad94dd0818376d58d")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければな"), "708c021d4951a3598cec9015572ce743")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければなら"), "f6167b086ace68b5e24709b6905651a6")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬ"), "6174657e8ccc173eb4aa9693cfefe845")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと"), "61e4b0838d5c6150259120e8dcae766f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決"), "081e410be43236b8855bdd39cfc4053f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意"), "fbd862d9ee653a2f41b1eee76006c767")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意し"), "59267677116c203f86d72cc166ffb8ee")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した"), "c8b3215eb33be2a0248de8f714ef3fb3")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。"), "e039433a2d574e3847cc7c20b86bcaf1")
	}
	
	func test_x86_128_seed() {
		XCTAssertEqual(MurmurHash3.x86_128Hex("", seed: 0x7fffffff), "c129af263e0227f33e0227f33e0227f3")
		XCTAssertEqual(MurmurHash3.x86_128Hex("H", seed: 0x7fffffff), "7318960e1fae47491fae47491fae4749")
		XCTAssertEqual(MurmurHash3.x86_128Hex("He", seed: 0x7fffffff), "4365e4103a7873d13a7873d13a7873d1")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hel", seed: 0x7fffffff), "85dc4c5c9d784c459d784c459d784c45")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hell", seed: 0x7fffffff), "4ce0ccc2f9f7836ef9f7836ef9f7836e")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello", seed: 0x7fffffff), "d199cd6138e926b1c36b04b1c36b04b1")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello ", seed: 0x7fffffff), "5f0c3567eb0ac007634d4b0e634d4b0e")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello W", seed: 0x7fffffff), "a80725c2f24af0d77357255a7357255a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello Wo", seed: 0x7fffffff), "3505a54c962ed61b4aff379f4aff379f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello Wor", seed: 0x7fffffff), "7c203edfd070f0eef55e38d596b56c05")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello Worl", seed: 0x7fffffff), "13705dbc5981bb0d16f728744bed8ed4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World", seed: 0x7fffffff), "709873d8a7d3702509d38e5f401e3bbb")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World!", seed: 0x7fffffff), "c66703b38475a0687ee6e07dcce15102")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! ", seed: 0x7fffffff), "664a44132f3fcfe6da64445e3e215838")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! H", seed: 0x7fffffff), "e956e8cff898ad20404c98dd66b68656")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! He", seed: 0x7fffffff), "92561cb20cbf4f04510646b19b03ce62")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hel", seed: 0x7fffffff), "e86a20fa710c98feebc2dd1c727d648c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hell", seed: 0x7fffffff), "c138efea1430dda096ff61dd6e784098")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello", seed: 0x7fffffff), "fefa94925c518e38b771ca4bfb4a482b")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello ", seed: 0x7fffffff), "c542740bcb66366953d71d2cbbeacf34")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello W", seed: 0x7fffffff), "9df880aaa178d79d2fb2684e49caf02e")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello Wo", seed: 0x7fffffff), "d869d794cfabca94b4c6a37f685fba53")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello Wor", seed: 0x7fffffff), "6fda44ef63f8e2c749e89b699daf47c4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello Worl", seed: 0x7fffffff), "9bc638af81864f2743a7ab2cfe43b401")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World", seed: 0x7fffffff), "adeb390848cc490a4d65f2feea682e2b")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World!", seed: 0x7fffffff), "d1ab28e6f4fc514c5e0df753b015261f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! ", seed: 0x7fffffff), "e776adf3d85d884fe3dcaabcc41ee3eb")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! H", seed: 0x7fffffff), "c489a0337cab1ec42d18f24b2712da88")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! He", seed: 0x7fffffff), "eb3c0b92d9c3d1649f2db2b5eedc85ba")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hel", seed: 0x7fffffff), "40443b8b5a338a59b12ef03d8a931cf0")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hell", seed: 0x7fffffff), "28f8064df3c60fcd4aa32fab25772035")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello", seed: 0x7fffffff), "c53a4ca6c841c9f10b616c84eff1d233")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello ", seed: 0x7fffffff), "cc5f21f6700a50071ad7d7ebc49f573e")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello W", seed: 0x7fffffff), "cb1dfd35d8462285c0aecd80f61af095")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello Wo", seed: 0x7fffffff), "2cef4faf79e3ada9184947ed8de9e9d1")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello Wor", seed: 0x7fffffff), "37b4ae7d830f33d938eae37e1645eef9")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello Worl", seed: 0x7fffffff), "066b67007c5b2c83dcf2c11754d9302d")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello World", seed: 0x7fffffff), "456230f80ed13b0bfaf2d3f8cc97af5a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("Hello World! Hello World! Hello World!", seed: 0x7fffffff), "e3c6f6b4f6a9a924be2cec052379f232")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メ", seed: 0x7fffffff), "62a70af6d16910e6d16910e6d16910e6")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロ", seed: 0x7fffffff), "b8d6bf7cae80bd235bcf4c9c5bcf4c9c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロス", seed: 0x7fffffff), "7fea30b0b9fbab33c5857aa8c4632bc8")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは", seed: 0x7fffffff), "e1f610170759917bc21fb94451fdc5d5")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激", seed: 0x7fffffff), "846de16084ffaa5ccd79f68b3eaa8512")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒", seed: 0x7fffffff), "cea02c7d27d7d2263b47810c738c4d75")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒し", seed: 0x7fffffff), "aecfb384cfe9096b521dad802d7f968f")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した", seed: 0x7fffffff), "285ddf676d3d1ad72c161f1cc15fad4c")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。", seed: 0x7fffffff), "0327aa9ff359a9c185c6242cc45e44c9")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必", seed: 0x7fffffff), "d2e43ce297217fc6b007e6eceb9f7a71")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず", seed: 0x7fffffff), "c373772dc0525fc29a8196e53c06e29a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、", seed: 0x7fffffff), "1ce7331e972c7a606e036ddd3dbddd52")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、か", seed: 0x7fffffff), "7bb9d35801b2fe2f955382abdf9e9025")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの", seed: 0x7fffffff), "f3213c602a5f34aeaaaa59e5e7a3b782")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪", seed: 0x7fffffff), "1a31767cf04e503bf7a956a1538082a4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智", seed: 0x7fffffff), "8c1628206889704e892e2b53dc391c7d")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴", seed: 0x7fffffff), "7061d1a4cbc037e42934e37f7d624ed4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐", seed: 0x7fffffff), "d91c08f0f68c4d4b8fb890217bcaae4b")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の", seed: 0x7fffffff), "c949a441ee6be74831e11322e8dd7c86")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王", seed: 0x7fffffff), "da8065c9dc4e63e1f39d3cbc1a04268d")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を", seed: 0x7fffffff), "a226ccbf8bad3989d6accb1a33b03265")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除", seed: 0x7fffffff), "3a7c58e7fd011d1697f047b4fe844a0b")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除か", seed: 0x7fffffff), "583a7a53674b8046597d6730c1d42ced")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かな", seed: 0x7fffffff), "1e81c6e850239275eb0662b340590731")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけ", seed: 0x7fffffff), "78dac6e944baa0e7f0aac887c1b77aec")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけれ", seed: 0x7fffffff), "a5c4672a0bb91a3b5a7a5f358a6e9567")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければ", seed: 0x7fffffff), "7ef3343f2b87c0e399df547293b348ba")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければな", seed: 0x7fffffff), "bcefe87c894736caccf0b922bd30c12a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければなら", seed: 0x7fffffff), "50e904e090d5190c3cafa66ec08423a9")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬ", seed: 0x7fffffff), "c92d631cacb68c121208914a52711b5e")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと", seed: 0x7fffffff), "6825fef7dee6200ba225be174259c0d6")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決", seed: 0x7fffffff), "765959d97696102779d78691e7f5b6cc")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意", seed: 0x7fffffff), "47785c03a799aae38090aed87937bc8a")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意し", seed: 0x7fffffff), "8f93921558323fb8e202e9f107c7b5e2")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した", seed: 0x7fffffff), "8d13da979bea05707064c2e09476bae4")
		XCTAssertEqual(MurmurHash3.x86_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。", seed: 0x7fffffff), "83804eb2d89d84ccf95d1881555aa0ad")
	}
	
	func test_x86_128_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data

		XCTAssertEqual(MurmurHash3.x86_128Hex(data), "f3d9739244076beaaaa983c7cc4c7251")
		XCTAssertEqual(MurmurHash3.x86_128Hex(data, seed: 0x7fffffff), "665293173c66d76ced7111d2ec5190a3")
		#endif
	}
	
	
	
	// MARK: - x64_128
	func test_x64_128() {
		XCTAssertEqual(MurmurHash3.x64_128Hex(""), "00000000000000000000000000000000")
		XCTAssertEqual(MurmurHash3.x64_128Hex("H"), "c5bf6fe79453c0d9788103cc1cea56db")
		XCTAssertEqual(MurmurHash3.x64_128Hex("He"), "888fe8bbaf7ecc8418ac28358c66acab")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hel"), "d630daf64f42f36370b46eed8a7672de")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hell"), "70e4c7599b5ddbdcee16db5b93aebaa6")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello"), "35b974ff55d4c41ca000eacf29125544")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello "), "02b05afe76a9ddb7df8e0330f2718a73")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello W"), "3a3043ca4c64cbb4a096bdec7d63cc94")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello Wo"), "8538fe7c0cd14c7f236facfb6f9a0237")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello Wor"), "b300949662a869f0d661d6f5653d2d56")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello Worl"), "401052776a6b73c9d449172d0fc6e27a")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World"), "1a6326abc1a0c2db83e61fcf9fc0b427")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World!"), "80025454af3196b2e57813856f452fa6")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! "), "f5712319ef57bd9e6d510360942a3da3")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! H"), "c56330f66d41c077f33a297397f62759")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! He"), "40d8df6543b738938b09733222e62f72")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hel"), "6a65d1648b43a4a1dcb945245c2303bb")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hell"), "7eb40cd1117eff089b0ecff7cca4d6b1")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello"), "9927edf82bbdf2e908f64babea479f1a")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello "), "8a05c7302dc33514af105dff03d6a876")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello W"), "9ca2129e53afc6841828ea8e7e7ab057")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello Wo"), "56929581091522d0b44c0956f029dc5f")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello Wor"), "dac49585f580f7231477794379a509a2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello Worl"), "d6825af09b31e6cb86174cc616880f36")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World"), "955807c45e776ed525f04a7c18ec8772")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World!"), "e881a28e49269b1e8d0d724eecb72e66")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! "), "820a056bc3de9f91d42cf31f9eed6a55")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! H"), "65033ab21496df5404f35b825911180d")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! He"), "5f3eefb73841db2fe4643b0d9cef2489")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hel"), "bc4deefad1d5a24650e47fbd9242fae2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hell"), "c069a70c80d009b45b01cb474edb9f92")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello"), "fad2258acff0645320a18c216de7a129")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello "), "925aa310b76a3ffaed5e83cfea01bce2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello W"), "024aed66473fef8445ad5fd2b196d00f")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello Wo"), "9a120ba0c3c4c695b25c0d4cf3386ec0")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello Wor"), "0fe2901d281ddce8bc5f2a9ad9ec047e")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello Worl"), "8a0577578c3ba68714bb0e1f770fb007")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello World"), "defbd673001125af62ba844c3cc22f6c")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello World!"), "f6cada2f71087efe66e67752734b005d")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メ"), "2a43e629c9fce5fc769880d1c8dc2f03")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロ"), "d781f1bb87ebeee2db777f4b98c83e58")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロス"), "1e7f1fc32ba9fa854c5c8f469ccdc395")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは"), "30ac378fd4d3b1bb8f3c177cc26dbf91")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激"), "aa1347debb4c9d16bbde75d328a940dc")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒"), "8cb1c62630c84c5f3394c12f04e4cdb1")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒し"), "1eadbd1a5815b6d461917aaf86a0bec2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した"), "4bd0cb475c7d2af2760d8d7840f9c39d")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。"), "d11ab25c98cb5fd93863575414e126d0")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必"), "c19ca373b32c58d598bb8b2a3dfd00e4")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず"), "78509e84e100892cff69834c1baefbf3")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、"), "6e0b330369272a40d2e5d513a0766cd7")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、か"), "546cff45a333cd6819797301bea4656e")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの"), "b5cc7dde6da069051322b04a185c6d71")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪"), "57999ce3bce577d06f2abc743c28a225")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智"), "3dd5c8cbdd27cb7c37b3992a95704ec0")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴"), "3914c03d265c7e05ea1363fdcdcff70e")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐"), "9aa72670f09882ac426412332a864e83")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の"), "967a7ee42733c2178f1627862e6ddbe5")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王"), "b201bb5b4cfd9ecda18b6b38e954dcc0")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を"), "4a14c7b5b6fa05f2d7edebb60c453123")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除"), "e1da4c7a9d1332ebbb0e56c9115ae113")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除か"), "1b19cfdcff9d936e3d5836d53701a19c")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かな"), "70927a4646bcb2340a401ca088d06dab")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけ"), "786e875d1cef28e013dfe78fd166dca1")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけれ"), "cb2a8e9e86638212b6505a37a4e28155")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければ"), "4ba9862934b2eed82ee110092662a907")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければな"), "0edab0540b9b055c549bd972cebb5ea4")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければなら"), "0d9e69d56ec12c33b65cf3a96f0a6a79")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬ"), "5c2b28bbce6cbbc046ef439d7bdd9986")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと"), "4046f7bb5dd8dc57bbe750ee0544c103")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決"), "1e976ae0cf51d7255955986e08c56ee2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意"), "ed5fd57c6f4c24b28482e395310a988f")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意し"), "f1cfb00b24ab2fe38bc73c002a68a447")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した"), "5d7902706e279ece573f11b1faf7ecbc")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。"), "1a8b64f8fe531d9af26ecc350566faa1")
	}
	
	func test_x64_128_seed() {
		XCTAssertEqual(MurmurHash3.x64_128Hex("", seed: 0x7fffffff), "656ac7570e166c3fc34c2ca1ed468e40")
		XCTAssertEqual(MurmurHash3.x64_128Hex("H", seed: 0x7fffffff), "b6f1db9dc8dbb252a96d85416bcd05cc")
		XCTAssertEqual(MurmurHash3.x64_128Hex("He", seed: 0x7fffffff), "5978e899f89cfb23b29d6eb3f6293cd2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hel", seed: 0x7fffffff), "9ef27f7dd28706c669aefe3f757b4e04")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hell", seed: 0x7fffffff), "110add5967078186c3dc4512cebd0c73")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello", seed: 0x7fffffff), "4c1ffe079196f6450e18782f31afa127")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello ", seed: 0x7fffffff), "b99129e07dde4cd62f4a5b0930c61899")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello W", seed: 0x7fffffff), "d76e8941b32b73421c799e18db1ed4b4")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello Wo", seed: 0x7fffffff), "6cf5a63c933076a84b766c9ae490fb88")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello Wor", seed: 0x7fffffff), "61c1e0e086ed29438c41461abcca1ff7")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello Worl", seed: 0x7fffffff), "5f699d27e1c98c92eef86cd143077f09")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World", seed: 0x7fffffff), "01ac978166e46cdb18e1c8018be32bc8")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World!", seed: 0x7fffffff), "a8c348436bb9375369e62d2b2cefbb56")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! ", seed: 0x7fffffff), "a6cb7bc52fe64dadffc0064cae7049f8")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! H", seed: 0x7fffffff), "5e991d1dba79df64e26c1b25797a1e5e")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! He", seed: 0x7fffffff), "a260273bc861742e8c737aadcb35b6ef")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hel", seed: 0x7fffffff), "6997900192048fc188270e384fe42290")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hell", seed: 0x7fffffff), "ab74508292b29772164159d960a70837")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello", seed: 0x7fffffff), "28d1ed647ba9f616feb7341079af4e57")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello ", seed: 0x7fffffff), "9abc23cafb81ae8b871894afd7e61322")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello W", seed: 0x7fffffff), "79a09413d46eb96d2613a419cf57dc7d")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello Wo", seed: 0x7fffffff), "00b0ab18ad6b99ee42d4cdd96add59b3")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello Wor", seed: 0x7fffffff), "cdac7eaa21e062ec518ce183b6a98fe1")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello Worl", seed: 0x7fffffff), "cb28ad682a96e382ce579b24dc09b16f")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World", seed: 0x7fffffff), "9ea2af5ac57f27e9220870ae912de787")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World!", seed: 0x7fffffff), "6028586a8c3df476fbd535aec6551aab")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! ", seed: 0x7fffffff), "6e80b1d590681f56ecc88acd4efbacd7")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! H", seed: 0x7fffffff), "470901deb8afc3700b7337fc9744d68d")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! He", seed: 0x7fffffff), "3fa9d95fb51176e6537f94b30f8d1be9")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hel", seed: 0x7fffffff), "4793d7c1a51fa9cb3f5bc05edfb57da6")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hell", seed: 0x7fffffff), "6cdbdd69e4065c0468446e9ea5961d90")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello", seed: 0x7fffffff), "fb1d2d6e7c235605a1dc348565dcd3e8")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello ", seed: 0x7fffffff), "d286082ab95bdfa2c5351841253a167c")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello W", seed: 0x7fffffff), "369408e239d94af5608726c5513b4000")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello Wo", seed: 0x7fffffff), "4c59a12acbd643b1e283120558a10132")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello Wor", seed: 0x7fffffff), "875519f61bc550bd770e353e4556df59")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello Worl", seed: 0x7fffffff), "39982c42dd8e1422441eef7c7b7ff770")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello World", seed: 0x7fffffff), "b60a51593d23430b0eca36a0db29a089")
		XCTAssertEqual(MurmurHash3.x64_128Hex("Hello World! Hello World! Hello World!", seed: 0x7fffffff), "d2c2001b93170cb1945953bac30824a0")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メ", seed: 0x7fffffff), "eec371b5c5a5186d8a8d64727db65b7b")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロ", seed: 0x7fffffff), "84f62e87b568ca00786224b4f3899c94")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロス", seed: 0x7fffffff), "a3012f4a9e5ff3f372207cd889383582")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは", seed: 0x7fffffff), "ca529a1ab3171dd6ed71f09f796bc277")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激", seed: 0x7fffffff), "9ad675df59adf624e3f702c3c0216196")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒", seed: 0x7fffffff), "28b384f28b9d0e1a84d45b9ff9034f1b")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒し", seed: 0x7fffffff), "9f0749a8c336313885bb97db13b20d7b")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した", seed: 0x7fffffff), "cb01479bfccb173538fdfa2d091b11c3")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。", seed: 0x7fffffff), "85b5eeab896ba7d63199714d19abeaa7")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必", seed: 0x7fffffff), "7253b6a215188edd0eee9b6995e09c39")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず", seed: 0x7fffffff), "daf7d742bb26f92c7bf04bbceab158db")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、", seed: 0x7fffffff), "44c312af19f25ca09631c07365566d8c")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、か", seed: 0x7fffffff), "40409cd0118ab62fa730037ca29ac49b")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの", seed: 0x7fffffff), "6174e3858b941d3e776f58c6bcab8fa2")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪", seed: 0x7fffffff), "5567e3fc547654579ed610d7485739d5")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智", seed: 0x7fffffff), "ea0d87ff505350e56ad3d3fb150a7451")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴", seed: 0x7fffffff), "00feedfa02291bdae86d468d1017df67")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐", seed: 0x7fffffff), "eb8dcfb757190ba0f7fdd32c3ab6a9a1")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の", seed: 0x7fffffff), "1fce75bfe72dc57483a13d7c62a4b527")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王", seed: 0x7fffffff), "4e6a735ac53b20e541c02e094be1eeec")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を", seed: 0x7fffffff), "1c88d363292a861a9a0ba2f556c8d78b")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除", seed: 0x7fffffff), "c211082e0608e0134cf1fea68d9a91e5")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除か", seed: 0x7fffffff), "c2d0739e22ca81152d588d81374c7aec")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かな", seed: 0x7fffffff), "17555ba8081b99e03367f795ab83379d")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけ", seed: 0x7fffffff), "ef008f965b2fc16c6935db07abc4bcb3")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなけれ", seed: 0x7fffffff), "bee364d1bd50ab96c1b35ee8e7fd4d89")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければ", seed: 0x7fffffff), "eb1f8ef1bcdb3726bbc5f247a648e965")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければな", seed: 0x7fffffff), "bedd79220460069415ef0341131c6777")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければなら", seed: 0x7fffffff), "ec4b5e2ae4f8396feb9631612dbdbd1f")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬ", seed: 0x7fffffff), "b2ef2195cedae1cdb49a53d4146aa258")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと", seed: 0x7fffffff), "7b876f82ae61493ca5b17261a1eb12dd")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決", seed: 0x7fffffff), "9538b2c2e3924100e262445f4b75ec69")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意", seed: 0x7fffffff), "8162f16edae6a31de6056e92c533fd13")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意し", seed: 0x7fffffff), "d5d6e5058bd997cca9ffabca83c97eb8")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した", seed: 0x7fffffff), "1318f75d00986b689d15e6dd5f753a46")
		XCTAssertEqual(MurmurHash3.x64_128Hex("メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。", seed: 0x7fffffff), "2b7beaca8e84e4e64046aed01f5382ef")
	}
	
	func test_x64_128_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		XCTAssertEqual(MurmurHash3.x64_128Hex(data), "ef12617f3e2a5f9a44b3598f2e09cd50")
		XCTAssertEqual(MurmurHash3.x64_128Hex(data, seed: 0x7fffffff), "c9e3c738ae105764b1d34bb24aa326c4")
		#endif
	}

}
