//
//  Pet.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation

public struct Pet: Codable {
    public enum Status: String, Codable {
        case available, pending, sold
    }
    
    public var id: Int
    public var category: Category
    public var name: String
    public var photoUrls: [String]
    public var tags: [Tag]
    public var status: Status
    
    public init(id: Int, category: Category, name: String, photoUrls: [String], tags: [Tag], status: Status) {
        self.id = id
        self.category = category
        self.name = name
        self.photoUrls = photoUrls
        self.tags = tags
        self.status = status
    }
}

extension Pet: Equatable {
    public static func == (lhs: Pet, rhs: Pet) -> Bool {
        lhs.id == rhs.id
            && lhs.category == rhs.category
            && lhs.name == rhs.name
            && lhs.photoUrls == rhs.photoUrls
            && lhs.tags == rhs.tags
            && lhs.status == rhs.status
    }
}
