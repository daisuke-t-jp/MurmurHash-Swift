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

	override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	
	func test86_32() {
		do {
			XCTAssertEqual(MurmurHash3.x86_32.digest(""), 0)

			let x86_32 = MurmurHash3.x86_32()
			XCTAssertEqual(MurmurHash3.x86_32.digest(""), x86_32.digest())
		}
		
		do {
			XCTAssertEqual(MurmurHash3.x86_32.digest(" "), 2129959832)

			let x86_32 = MurmurHash3.x86_32()
			x86_32.update(" ")
			XCTAssertEqual(MurmurHash3.x86_32.digest(" "), x86_32.digest())
		}
		
		do {
			XCTAssertEqual(MurmurHash3.x86_32.digest("abcdefghijklmnopqrstuvwxyz"), 2739798893)
			
			let x86_32 = MurmurHash3.x86_32()
			x86_32.update("abc")
			x86_32.update("d")
			x86_32.update("efgh")
			x86_32.update("ijklm")
			x86_32.update("nopqrstuvwxyz")
			XCTAssertEqual(MurmurHash3.x86_32.digest("abcdefghijklmnopqrstuvwxyz"), x86_32.digest())
		}
	}

	func test86_128() {
		do {
			XCTAssertEqual(MurmurHash3.x86_128.digestHex(""), "00000000000000000000000000000000")
			
			let x86_128 = MurmurHash3.x86_128()
			XCTAssertEqual(MurmurHash3.x86_128.digest(""), x86_128.digest())
		}
		
		do {
			XCTAssertEqual(MurmurHash3.x86_128.digestHex(" ").lowercased(), "b6db78e7959b24eb959b24eb959b24eb")
			
			let x86_128 = MurmurHash3.x86_128()
			x86_128.update(" ")
			XCTAssertEqual(MurmurHash3.x86_128.digest(" "), x86_128.digest())
		}
		
		do {
			XCTAssertEqual(MurmurHash3.x86_128.digestHex("abcdefghijklmnopqrstuvwxyz").lowercased(), "3e340613666f2f6617f6566e44e33d2c")
			
			let x86_128 = MurmurHash3.x86_128()
			x86_128.update("abc")
			x86_128.update("d")
			x86_128.update("efgh")
			x86_128.update("ijklm")
			x86_128.update("nopqrstuvwxyz")
			XCTAssertEqual(MurmurHash3.x86_128.digest("abcdefghijklmnopqrstuvwxyz"), x86_128.digest())
		}
	}
	
	func test64_128() {
		do {
			XCTAssertEqual(MurmurHash3.x64_128.digestHex(""), "00000000000000000000000000000000")
			
			let x64_128 = MurmurHash3.x64_128()
			XCTAssertEqual(MurmurHash3.x64_128.digest(""), x64_128.digest())
		}
		
		do {
			XCTAssertEqual(MurmurHash3.x64_128.digestHex(" ").lowercased(), "18f081109e84f7393fd44c9b7c437cb8")
			
			let x64_128 = MurmurHash3.x64_128()
			x64_128.update(" ")
			XCTAssertEqual(MurmurHash3.x64_128.digest(" "), x64_128.digest())
		}
		
		do {
			XCTAssertEqual(MurmurHash3.x64_128.digestHex("abcdefghijklmnopqrstuvwxyz").lowercased(), "749c9d7e516f4aa9e9ad9c89b6a7d529")
			
			let x64_128 = MurmurHash3.x64_128()
			x64_128.update("abc")
			x64_128.update("d")
			x64_128.update("efgh")
			x64_128.update("ijklm")
			x64_128.update("nopqrstuvwxyz")
			XCTAssertEqual(MurmurHash3.x64_128.digest("abcdefghijklmnopqrstuvwxyz"), x64_128.digest())
		}
	}
}
