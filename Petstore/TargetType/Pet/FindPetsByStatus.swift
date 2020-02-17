//
//  FindPetsByStatus.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public struct FindPetByStatus: PetstoreApiTargetType {
    public typealias Response = [Pet]
    
    public var path: String = "/pet/findByStatus"
    public var method: Moya.Method = .get
    public var headers: [String: String]?
    public var task: Task { .requestParameters(parameters: ["status": statuses], encoding: URLEncoding.default) }
    
    let statuses: [Pet.Status]
    public init(_ statuses: [Pet.Status]) {
        self.statuses = statuses
    }
}
