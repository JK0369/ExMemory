//
//  MemoryDump.swift
//  ExMemoryAddress
//
//  Created by 김종권 on 2023/08/05.
//

// https://gist.github.com/godrm/a2bff14ed36a98aa62f934a6ad426617#file-memorydump-swift
import Foundation

struct Memory {
    @inlinable static func dump<T>(variable: inout T) {
        withUnsafePointer(to: &variable) { print($0) }
    }
    
    @inlinable static func dump(with: UnsafeRawPointer) {
        let address = Int(bitPattern: with)
        print(String(format:"%018p", address))
    }
    
    @inlinable static func dump(object: AnyObject) {
        print(Unmanaged.passUnretained(object).toOpaque())
    }
}
