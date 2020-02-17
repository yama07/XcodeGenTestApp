//
//  ApiResponse.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation

public struct ApiResponse: Codable {
    public var code: Int
    public var type: String
    public var message: String
}

extension ApiResponse: Equatable {
    public static func == (lhs: ApiResponse, rhs: ApiResponse) -> Bool {
        lhs.code == rhs.code
            && lhs.type == rhs.type
            && lhs.message == rhs.message
    }
}
