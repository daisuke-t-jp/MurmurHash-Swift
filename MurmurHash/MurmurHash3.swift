//
//  MurmurHash3.swift
//  MurmurHash
//
//  Created by Daisuke T on 2019/02/06.
//  Copyright © 2019 MurmurHash. All rights reserved.
//

import Foundation



// TODO: add mac config
// TODO: test
// TODO: travis
// TODO: podspec
// TODO: gitignoe
// TODO: readme
// TODO: default seed
// TODO: override func version
// TODO: header image
// TODO: demo



public class MurmurHash3 {
	
	// MARK: - Utility
	static private func rotl<T: FixedWidthInteger>(_ x: T, r: Int) -> T {
		return (x << r) | (x >> (T.bitWidth - r))
	}

	static private func fmix32(_ h: UInt32) -> UInt32 {
		var h2 = h

		h2 ^= h2 >> 16
		h2 *= 0x85ebca6b
		h2 ^= h2 >> 13
		h2 *= 0xc2b2ae35
		h2 ^= h2 >> 16

		return h2
	}
	
	static private func fmix64(_ k: UInt64) -> UInt64 {
		var k2 = k

		k2 ^= k2 >> 33
		k2 *= 0xff51afd7ed558ccd
		k2 ^= k2 >> 33
		k2 *= 0xc4ceb9fe1a85ec53
		k2 ^= k2 >> 33
		
		return k2
	}

	
	
	// MARK - x86 32bit
	public func x86_32(_ array: [UInt8], seed: UInt32 = 0) -> UInt32 {
	
		let c1: UInt32 = 0xcc9e2d51
		let c2: UInt32 = 0x1b873593

		let nblocks = array.count / 4
		var h1 = seed

		
		/**
		 * body
		 */
		let base = nblocks * 4

		for i in -nblocks..<0 {

			let elm = array[base + i]
			var k1: UInt32 = UInt32(elm)
			
			k1 *= c1
			k1 = MurmurHash3.rotl(k1, r: 15)
			k1 *= c2
			
			h1 ^= k1
			h1 = MurmurHash3.rotl(h1, r: 13)
			h1 = h1 * 5 + 0xe6546b64
		}


		/**
		 * tail
		 */
		var k1: UInt32 = 0

		switch array.count & 3 {
		case 3:
			k1 ^= UInt32(array[base + 2]) << 16
			
		case 2:
			k1 ^= UInt32(array[base + 1]) << 8
			
		case 1:
			k1 ^= UInt32(array[base])
			k1 *= c1
			k1 = MurmurHash3.rotl(k1, r: 15)
			k1 *= c2
			h1 ^= k1
			
		default:
			break
		}


		/**
		 * finalization
		 */
		h1 ^= UInt32(array.count)

		h1 = MurmurHash3.fmix32(h1)
		
		return h1
	}
	


	// MARK - x86 128bit
	public func x86_128(_ array: [UInt8], seed: UInt32 = 0) -> (h1: UInt32, h2: UInt32, h3: UInt32, h4: UInt32) {

		let c1: UInt32 = 0x239b961b
		let c2: UInt32 = 0xab0e9789
		let c3: UInt32 = 0x38b34ae5
		let c4: UInt32 = 0xa1e38b93
		
		let nblocks = array.count / 16
		var h1 = seed
		var h2 = seed
		var h3 = seed
		var h4 = seed

		
		/**
		 * body
		 */
		let base = nblocks * 16
		for i in -nblocks..<0 {
			
			var k1 = UInt32(array[base + i * 4 + 0])
			var k2 = UInt32(array[base + i * 4 + 1])
			var k3 = UInt32(array[base + i * 4 + 2])
			var k4 = UInt32(array[base + i * 4 + 3])

			k1 *= c1
			k1 = MurmurHash3.rotl(k1, r: 15)
			k1 *= c2
			h1 ^= k1

			h1 = MurmurHash3.rotl(h1, r: 19)
			h1 += h2
			h1 = h1 * 5 + 0x561ccd1b

			k2 *= c2
			k2 = MurmurHash3.rotl(k2, r: 16)
			k2 *= c3
			h2 ^= k2
			
			h2 = MurmurHash3.rotl(h2, r: 17)
			h2 += h3
			h2 = h2 * 5 + 0x0bcaa747

			k3 *= c3
			k3 = MurmurHash3.rotl(k3, r: 17)
			k3 *= c4
			h3 ^= k3

			h3 = MurmurHash3.rotl(h3, r: 15)
			h3 += h4
			h3 = h3 * 5 + 0x96cd1c35

			k4 *= c4
			k4 = MurmurHash3.rotl(k4, r: 18)
			k4 *= c1
			h4 ^= k4

			h4 = MurmurHash3.rotl(h4, r: 13)
			h4 += h1
			h4 = h4 * 5 + 0x32ac3b17
		}


		/**
		 * tail
		 */
		var k1 = UInt32(0)
		var k2 = UInt32(0)
		var k3 = UInt32(0)
		var k4 = UInt32(0)

		switch array.count & 15 {
		case 15:
			k4 ^= UInt32(array[base + 14]) << 16

		case 14:
			k4 ^= UInt32(array[base + 13]) << 8
		
		case 13:
			k4 ^= UInt32(array[base + 12]) << 0
			k4 *= c4
			k4 = MurmurHash3.rotl(k4, r: 18)
			k4 *= c1
			h4 ^= k4

			
		case 12:
			k3 ^= UInt32(array[base + 11]) << 24

		case 11:
			k3 ^= UInt32(array[base + 10]) << 16

		case 10:
			k3 ^= UInt32(array[base + 9]) << 8

		case 9:
			k3 ^= UInt32(array[base + 8]) << 0
			k3 *= c3
			k3 = MurmurHash3.rotl(k3, r: 17)
			k3 *= c4
			h3 ^= k3


		case 8:
			k2 ^= UInt32(array[base + 7]) << 24

		case 7:
			k2 ^= UInt32(array[base + 6]) << 16

		case 6:
			k2 ^= UInt32(array[base + 5]) << 8

		case 5:
			k2 ^= UInt32(array[base + 4]) << 0
			k2 *= c2
			k2 = MurmurHash3.rotl(k2, r: 16)
			k2 *= c3
			h2 ^= k2

		case 4:
			k1 ^= UInt32(array[base + 3]) << 24

		case 3:
			k1 ^= UInt32(array[base + 2]) << 16

		case 2:
			k1 ^= UInt32(array[base + 1]) << 8

		case 1:
			k1 ^= UInt32(array[base + 0]) << 0
			k1 *= c1
			k1 = MurmurHash3.rotl(k1, r: 15)
			k1 *= c2
			h1 ^= k1

		default:
			break
		}


		/**
		 * finalization
		 */
		h1 ^= UInt32(array.count)
		h2 ^= UInt32(array.count)
		h3 ^= UInt32(array.count)
		h4 ^= UInt32(array.count)
		
		h1 += h2
		h1 += h3
		h1 += h4
		h2 += h1
		h3 += h1
		h4 += h1

		h1 = MurmurHash3.fmix32(h1)
		h2 = MurmurHash3.fmix32(h2)
		h3 = MurmurHash3.fmix32(h3)
		h4 = MurmurHash3.fmix32(h4)

		h1 += h2
		h1 += h3
		h1 += h4
		h2 += h1
		h3 += h1
		h4 += h1

		return (h1: h1, h2: h2, h3: h3, h4: h4)
	}


	// MARK - x64 128bit
	public func x64_128(_ array: [UInt8], seed: UInt64 = 0) -> (h1: UInt64, h2: UInt64) {

		let c1: UInt64 = 0x87c37b91114253d5
		let c2: UInt64 = 0x4cf5ad432745937f
		
		let nblocks = array.count / 16
		var h1 = seed
		var h2 = seed


		/**
		 * body
		 */
		for i in 0..<nblocks {

			var k1 = UInt64(array[i * 2 + 0])
			var k2 = UInt64(array[i * 2 + 1])

			k1 *= c1
			k1 = MurmurHash3.rotl(k1, r: 31)
			k1 *= c2
			h1 ^= k1

			h1 = MurmurHash3.rotl(h1, r: 27)
			h1 += h2
			h1 = h1 * 5 + 0x52dce729

			k2 *= c2
			k2 = MurmurHash3.rotl(k2, r: 33)
			k2 *= c1
			h2 ^= k2

			h2 = MurmurHash3.rotl(h2, r: 31)
			h2 += h1
			h2 = h2 * 5 + 0x38495ab5
		}
		
		
		/**
		 * tail
		 */
		let base = nblocks * 16

		var k1 = UInt64(0)
		var k2 = UInt64(0)
		
		switch array.count & 15 {
		case 15:
			k2 ^= UInt64(array[base + 14]) << 48

		case 14:
			k2 ^= UInt64(array[base + 13]) << 40

		case 13:
			k2 ^= UInt64(array[base + 12]) << 32

		case 12:
			k2 ^= UInt64(array[base + 11]) << 24

		case 11:
			k2 ^= UInt64(array[base + 10]) << 16

		case 10:
			k2 ^= UInt64(array[base + 9]) << 8

		case 9:
			k2 ^= UInt64(array[base + 8]) << 0
			k2 *= c2
			k2 = MurmurHash3.rotl(k2, r: 33)
			k2 *= c1
			h2 ^= k2

			
		case 8:
			k1 ^= UInt64(array[base + 7]) << 56

		case 7:
			k1 ^= UInt64(array[base + 6]) << 48

		case 6:
			k1 ^= UInt64(array[base + 5]) << 40

		case 5:
			k1 ^= UInt64(array[base + 4]) << 32

		case 4:
			k1 ^= UInt64(array[base + 3]) << 24

		case 3:
			k1 ^= UInt64(array[base + 2]) << 16

		case 2:
			k1 ^= UInt64(array[base + 1]) << 8

		case 1:
			k1 ^= UInt64(array[base + 0]) << 0
			k1 *= c1
			k1 = MurmurHash3.rotl(k1, r: 31)
			k1 *= c2
			h1 ^= k1

		default:
			break
		}


		/**
		 * finalization
		 */
		h1 ^= UInt64(array.count)
		h2 ^= UInt64(array.count)

		h1 += h2
		h2 += h1

		h1 = MurmurHash3.fmix64(h1)
		h2 = MurmurHash3.fmix64(h2)

		h1 += h2
		h2 += h1

		return (h1: h1, h2: h2)
	}

}
