//
//  Member.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Member : ImmutableMappable {
    
    var id: String?
    var email: String;
    var firstname: String;
    var lastname: String;
    var birthdate: Date;
    var phone: String;
    var location: String;
    var createdAt: Date;

    
    // 1 | Initializer
    init(id: String?, email: String, firstname: String, lastname: String, birthdate: Date, phone: String, location: String, createdAt: Date) {
        self.id = id
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.phone = phone
        self.location = location
        self.createdAt = createdAt
    }
    // 2 | Initializer
    init(email: String, firstname: String, lastname: String, birthdate: Date, phone: String, location: String, createdAt: Date) {
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.phone = phone
        self.location = location
        self.createdAt = createdAt
    }
    
    
    // JSON -> Model
    public init(map: Map) throws {
        self.id         = try map.value("_id")
        self.email = try map.value("email")
        self.firstname = try map.value("firstname")
        self.lastname = try map.value("lastname")
        self.birthdate = try map.value("birthdate", using: DateTransform())
        self.phone = try map.value("phone")
        self.location = try map.value("location")
        self.createdAt = try map.value("createdAt", using: DateTransform())
    }
    
    // Model -> JSON
    public func mapping(map: Map) {
        id          >>> (map["_id"])
        email >>> map["email"]
        firstname >>> map["firstname"]
        lastname >>> map["lastname"]
        birthdate >>> (map["birthdate"], using: DateTransform())
        phone >>> map["phone"]
        location >>> map["location"]
        createdAt >>> (map["createdAt"], using: DateTransform())
    }
    
}
