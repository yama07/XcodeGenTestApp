//
//  GetPetById.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public struct GetPetById: PetstoreApiTargetType {
    public typealias Response = Pet
    
    public var path: String { "/pet/\(petId)" }
    public var method: Moya.Method = .get
    public var headers: [String: String]?
    public var task: Task { .requestPlain }
    
    let petId: Int
    public init(_ petId: Int) {
        self.petId = petId
    }
}
