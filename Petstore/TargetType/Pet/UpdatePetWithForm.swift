//
//  UpdatePetWithForm.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public struct UpdatePetWithForm: PetstoreApiTargetType {
    public typealias Response = Pet
    
    public var path: String { "/pet/\(petId)" }
    public var method: Moya.Method = .post
    public var headers: [String: String]? = ["Content-Type": "application/x-www-form-urlencoded"]
    public var task: Task { .requestParameters(parameters: ["name": name,
                                                            "status": status],
                                               encoding: URLEncoding.default) }
    
    let petId: Int
    let name: String
    let status: Status
    public init(_ petId: Int, name: String, status: Status) {
        self.petId = petId
        self.name = name
        self.status = status
    }
}
