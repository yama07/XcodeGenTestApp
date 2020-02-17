//
//  User.swift
//  Petstore
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation

public struct User: Codable {
    public var id: Int
    public var username: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var password: String
    public var phone: String
    public var userStatus: Int
    
    public init(id: Int,
                username: String,
                firstName: String,
                lastName: String,
                email: String,
                password: String,
                phone: String,
                userStatus: Int) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.phone = phone
        self.userStatus = userStatus
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
            && lhs.username == rhs.username
            && lhs.firstName == rhs.firstName
            && lhs.lastName == rhs.lastName
            && lhs.email == rhs.email
            && lhs.password == rhs.password
            && lhs.phone == rhs.phone
            && lhs.userStatus == rhs.userStatus
    }
}
