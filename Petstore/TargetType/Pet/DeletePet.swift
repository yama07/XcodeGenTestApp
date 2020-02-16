//
//  DeletePet.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public struct DeletePet: PetstoreApiTargetType {
    public typealias Response = NoBody
    
    public var path: String { "/pet/\(petId)" }
    public var method: Moya.Method = .delete
    public var headers: [String: String]?
    public var task: Task { .requestPlain }
    
    let petId: Int
    public init(_ petId: Int) {
        self.petId = petId
    }
}
