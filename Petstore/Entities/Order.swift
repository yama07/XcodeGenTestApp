//
//  Order.swift
//  Petstore
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation

public struct Order: Codable {
    public enum Status: String, Codable {
        case placed, approved, delivered
    }
    
    public var id: Int
    public var petId: Int
    public var quantity: Int
    public var shipDate: Data
    public var status: Order.Status
    public var complete: Bool
    
    public init(id: Int,
                petId: Int,
                quantity: Int,
                shipDate: Data,
                status: Order.Status,
                complete: Bool) {
        self.id = id
        self.petId = petId
        self.quantity = quantity
        self.shipDate = shipDate
        self.status = status
        self.complete = complete
    }
}

extension Order: Equatable {
    public static func == (lhs: Order, rhs: Order) -> Bool {
        lhs.id == rhs.id
            && lhs.petId == rhs.petId
            && lhs.quantity == rhs.quantity
            && lhs.shipDate == rhs.shipDate
            && lhs.status == rhs.status
            && lhs.complete == rhs.complete
    }
}
