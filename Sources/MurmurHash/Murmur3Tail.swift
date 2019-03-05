//
//  Murmur3Tail.swift
//  MurmurHash
//
//  Created by Daisuke T on 2019/03/04.
//  Copyright © 2019 MurmurHash. All rights reserved.
//

import Foundation

final class Murmur3Tail {
	// MARK: - Property
	private var array: [UInt8]
	private var max: Int
	
	
	// MARK: - Life cycle
	public init(_ max: Int) {
		self.max = max
		array = [UInt8]()
	}
}



// MARK: - Operation
extension Murmur3Tail {
	public func add(_ newElement: UInt8) {
		if array.count >= max {
			array.replaceSubrange(0..<max-1, with: Array(array[1..<max]))
			array.removeLast()
		}
		
		array.append(newElement)
	}
	
	public func rawArray() -> [UInt8] {
		return Array(array)
	}
}
