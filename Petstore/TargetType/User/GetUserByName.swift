//
//  GetUserByName.swift
//  Petstore
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation
import Moya

public struct GetUserByName: PetstoreApiTargetType {
    public typealias Response = User
    
    public var path: String { "/user/\(username)" }
    public var method: Moya.Method = .get
    public var headers: [String: String]?
    public var task: Task { .requestPlain }
    
    let username: String
    public init(_ username: String) {
        self.username = username
    }
}
