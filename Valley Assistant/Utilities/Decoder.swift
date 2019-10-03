//
//  Decoder.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

// Handy extension to reduce manual work when decoding json
// https://kean.github.io/post/codable-tips-and-tricks

extension KeyedDecodingContainer {
    public func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
        return try self.decode(T.self, forKey: key)
    }

    public func decodeIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
}
