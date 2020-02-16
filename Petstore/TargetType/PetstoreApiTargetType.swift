//
//  PetstoreApiTargetType.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public protocol PetstoreApiTargetType: TargetType {
    associatedtype Response: Codable
}

extension PetstoreApiTargetType {
    public var baseURL: URL { URL(string: "https://petstore.swagger.io/v2")! }
    public var sampleData: Data {
        let path = Bundle.main.path(forResource: "samples", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
}
