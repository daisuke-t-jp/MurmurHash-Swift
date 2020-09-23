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
        print("x86_32(\"Hello World!\") -> \(MurmurHash3.x86_32.digest("Hello World!"))")
        print("x86_32(\"Hello World!\", seed: 0x7fffffff) -> \(MurmurHash3.x86_32.digest("Hello World!", seed: 0x7fffffff))")
        print("x86_32Hex(\"Hello World!\") -> 0x\(MurmurHash3.x86_32.digestHex("Hello World!"))")
        print("x86_32Hex(\"Hello World!\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x86_32.digestHex("Hello World!", seed: 0x7fffffff))")
    }
    
    static func x86_32_file() {
        let bundle = Bundle(for: Common.self)
        let path = bundle.path(forResource: "alice29", ofType: "txt")!
        let data = NSData(contentsOfFile: path)! as Data
        
        let bufSize = 1024
        var index = 0
        
        let mmh = MurmurHash3.x86_32()
        let mmh2 = MurmurHash3.x86_32(0x7fffffff)
        
        repeat {
            var lastIndex = index + bufSize
            if lastIndex > data.count {
                lastIndex = index + data.count - index
            }
            
            let data2 = data[index..<lastIndex]
            mmh.update(data2)
            mmh2.update(data2)
            
            index += data2.count
            if index >= data.count {
                break
            }
        } while(true)
        
        print("x86_32Hex(file -> 0x\(mmh.digestHex())")
        print("x86_32Hex(file, seed: 0x7fffffff) -> 0x\(mmh2.digestHex())")
    }
    
    
    
    static func x86_128() {
        print("x86_128(\"Hello World!\") ->" +
                " \(MurmurHash3.x86_128.digest("Hello World!")[0])" +
                " \(MurmurHash3.x86_128.digest("Hello World!")[1])" +
                " \(MurmurHash3.x86_128.digest("Hello World!")[2])" +
                " \(MurmurHash3.x86_128.digest("Hello World!")[3])")
        print("x86_128(\"Hello World!\", seed: 0x7fffffff) ->" +
                " \(MurmurHash3.x86_128.digest("Hello World!", seed: 0x7fffffff)[0])" +
                " \(MurmurHash3.x86_128.digest("Hello World!", seed: 0x7fffffff)[1])" +
                " \(MurmurHash3.x86_128.digest("Hello World!", seed: 0x7fffffff)[2])" +
                " \(MurmurHash3.x86_128.digest("Hello World!", seed: 0x7fffffff)[3])")
        print("x86_128Hex(\"Hello World!\") -> 0x\(MurmurHash3.x86_128.digestHex("Hello World!"))")
        print("x86_128Hex(\"Hello World!\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x86_128.digestHex("Hello World!", seed: 0x7fffffff))")
    }
    
    static func x86_128_file() {
        let bundle = Bundle(for: Common.self)
        let path = bundle.path(forResource: "alice29", ofType: "txt")!
        let data = NSData(contentsOfFile: path)! as Data
        
        let bufSize = 1024
        var index = 0
        
        let mmh = MurmurHash3.x86_128()
        let mmh2 = MurmurHash3.x86_128(0x7fffffff)
        
        repeat {
            var lastIndex = index + bufSize
            if lastIndex > data.count {
                lastIndex = index + data.count - index
            }
            
            let data2 = data[index..<lastIndex]
            mmh.update(data2)
            mmh2.update(data2)
            
            index += data2.count
            if index >= data.count {
                break
            }
        } while(true)
        
        print("x86_128Hex(file -> 0x\(mmh.digestHex())")
        print("x86_128Hex(file, seed: 0x7fffffff) -> 0x\(mmh2.digestHex())")
    }
    
    
    
    static func x64_128() {
        print("x64_128(\"Hello World!\") ->" +
                " \(MurmurHash3.x64_128.digest("Hello World!")[0])" +
                " \(MurmurHash3.x64_128.digest("Hello World!")[1])")
        print("x64_128(\"Hello World!\", seed: 0x7fffffff) ->" +
                " \(MurmurHash3.x64_128.digest("Hello World!", seed: 0x7fffffff)[0])" +
                " \(MurmurHash3.x64_128.digest("Hello World!", seed: 0x7fffffff)[1])")
        print("x64_128Hex(\"Hello World!\") -> 0x\(MurmurHash3.x64_128.digestHex("Hello World!"))")
        print("x64_128Hex(\"Hello World!\", seed: 0x7fffffff) -> 0x\(MurmurHash3.x64_128.digestHex("Hello World!", seed: 0x7fffffff))")
    }
    
    static func x64_128_file() {
        let bundle = Bundle(for: Common.self)
        let path = bundle.path(forResource: "alice29", ofType: "txt")!
        let data = NSData(contentsOfFile: path)! as Data
        
        let bufSize = 1024
        var index = 0
        
        let mmh = MurmurHash3.x64_128()
        let mmh2 = MurmurHash3.x64_128(0x7fffffff)
        
        repeat {
            var lastIndex = index + bufSize
            if lastIndex > data.count {
                lastIndex = index + data.count - index
            }
            
            let data2 = data[index..<lastIndex]
            mmh.update(data2)
            mmh2.update(data2)
            
            index += data2.count
            if index >= data.count {
                break
            }
        } while(true)
        
        print("x64_128Hex(file -> 0x\(mmh.digestHex())")
        print("x64_128Hex(file, seed: 0x7fffffff) -> 0x\(mmh2.digestHex())")
    }
    
}
