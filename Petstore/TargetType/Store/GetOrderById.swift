//
//  GetOrderById.swift
//  Petstore
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation
import Moya

public struct GetOrderById: PetstoreApiTargetType {
    public typealias Response = Order
    
    public var path: String { "/store/order/\(orderId)" }
    public var method: Moya.Method = .get
    public var headers: [String: String]?
    public var task: Task { .requestPlain }
    
    let orderId: Int
    public init(_ orderId: Int) {
        self.orderId = orderId
    }
}
