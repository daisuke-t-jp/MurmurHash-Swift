//
//  Common.swift
//  MurmurHashDemo
//
//  Created by Daisuke T on 2019/02/14.
//  Copyright © 2019 MurmurHashDemo. All rights reserved.
//

import Foundation

import MurmurHash_Swift

class Common {
	
	static func x86_32() {
		print("x86_32(\"Hello World!\") -> \(MurmurHash3.x86_32("Hello World!"))")
		print("x86_32(\"Hello World!\", seed: 0x7fffffff) -> \(MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff))")
		print("x86_32Hex(\"Hello World!\") -> 0x\(MurmurHash3.x86_32Hex("Hello World!"))")
		print("x86_32Hex(\"Hello World!\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x86_32Hex("Hello World!", seed: 0x7fffffff))")
	}
	
	static func x86_32_file() {
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data

		print("x86_32(file) -> \(MurmurHash3.x86_32(data))")
		print("x86_32(file, seed: 0x7fffffff) -> \(MurmurHash3.x86_32(data, seed: 0x7fffffff))")
		print("x86_32Hex(file) -> 0x\(MurmurHash3.x86_32Hex(data))")
		print("x86_32Hex(file, seed: 0x7fffffff) -> 0x\(MurmurHash3.x86_32Hex(data, seed: 0x7fffffff))")
	}
	
	
	
	static func x86_128() {
		print("x86_128(\"Hello World!\") ->" +
			" \(MurmurHash3.x86_128("Hello World!")[0])" +
			" \(MurmurHash3.x86_128("Hello World!")[1])" +
			" \(MurmurHash3.x86_128("Hello World!")[2])" +
			" \(MurmurHash3.x86_128("Hello World!")[3])")
		print("x86_128(\"Hello World!\", seed: 0x7fffffff) ->" +
			" \(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[0])" +
			" \(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[1])" +
			" \(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[2])" +
			" \(MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)[3])")
		print("x86_128Hex(\"Hello World!\") -> 0x\(MurmurHash3.x86_128Hex("Hello World!"))")
		print("x86_128Hex(\"Hello World!\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x86_128Hex("Hello World!", seed: 0x7fffffff))")
	}
	
	static func x86_128_file() {
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		print("x86_128(\"file\") ->" +
			" \(MurmurHash3.x86_128(data)[0])" +
			" \(MurmurHash3.x86_128(data)[1])" +
			" \(MurmurHash3.x86_128(data)[2])" +
			" \(MurmurHash3.x86_128(data)[3])")
		print("x86_128(\"file!\", seed: 0x7fffffff) ->" +
			" \(MurmurHash3.x86_128(data, seed: 0x7fffffff)[0])" +
			" \(MurmurHash3.x86_128(data, seed: 0x7fffffff)[1])" +
			" \(MurmurHash3.x86_128(data, seed: 0x7fffffff)[2])" +
			" \(MurmurHash3.x86_128(data, seed: 0x7fffffff)[3])")
		print("x86_128Hex(\"file\") -> 0x\(MurmurHash3.x86_128Hex(data))")
		print("x86_128Hex(\"file\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x86_128Hex(data, seed: 0x7fffffff))")
	}
	
	
	
	static func x64_128() {
		print("x64_128(\"Hello World!\") ->" +
			" \(MurmurHash3.x64_128("Hello World!")[0])" +
			" \(MurmurHash3.x64_128("Hello World!")[1])")
		print("x64_128(\"Hello World!\", seed: 0x7fffffff) ->" +
			" \(MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[0])" +
			" \(MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)[1])")
		print("x64_128Hex(\"Hello World!\") -> 0x\(MurmurHash3.x64_128Hex("Hello World!"))")
		print("x64_128Hex(\"Hello World!\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x64_128Hex("Hello World!", seed: 0x7fffffff))")
	}
	
	static func x64_128_file() {
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data

		print("x64_128(\"file\") ->" +
			" \(MurmurHash3.x64_128(data)[0])" +
			" \(MurmurHash3.x64_128(data)[1])")
		print("x64_128(\"file!\", seed: 0x7fffffff) ->" +
			" \(MurmurHash3.x64_128(data, seed: 0x7fffffff)[0])" +
			" \(MurmurHash3.x64_128(data, seed: 0x7fffffff)[1])")
		print("x64_128Hex(\"file\") -> 0x\(MurmurHash3.x64_128Hex(data))")
		print("x64_128Hex(\"file\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x64_128Hex(data, seed: 0x7fffffff))")
	}

}
