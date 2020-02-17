//
//  Tag.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation

public struct Tag: Codable {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension Tag: Equatable {
    public static func == (lhs: Tag, rhs: Tag) -> Bool {
        lhs.id == rhs.id
            && lhs.name == rhs.name
    }
}
