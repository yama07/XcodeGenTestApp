//
//  AddPet.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public struct AddPet: PetstoreApiTargetType {
    public typealias Response = Pet
    
    public var path: String = "/pet"
    public var method: Moya.Method = .post
    public var headers: [String: String]? = ["Content-type": "application/json; charset=UTF-8"]
    public var task: Task { .requestJSONEncodable(pet) }
    
    let pet: Pet
    public init(_ pet: Pet) {
        self.pet = pet
    }
}
