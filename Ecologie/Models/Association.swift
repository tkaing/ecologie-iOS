//
//  Association.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Association: ImmutableMappable {
    
    var id: String?
    var name: String
    var email: String
    var phone: String
    var location: String
    var birthdate: Date
    var createdAt: Date
    var identifier: String
    
    // 1 | Initializer
    init(id: String, email: String, name: String, identifier: String, phone: String, location: String, birthdate: Date, createdAt: Date) {
        self.id         = id
        self.name       = name
        self.email      = email
        self.phone      = phone
        self.location   = location
        self.birthdate  = birthdate
        self.createdAt  = createdAt
        self.identifier = identifier
    }
    
    // 2 | Initializer
    init(email: String, name: String, identifier: String, phone: String, location: String, birthdate: Date, createdAt: Date) {
        self.name       = name
        self.email      = email
        self.phone      = phone
        self.location   = location
        self.birthdate  = birthdate
        self.createdAt  = createdAt
        self.identifier = identifier
    }
    
    // JSON -> Model
    public init(map: Map) throws {
        self.id         = try map.value("_id")
        self.name       = try map.value("name")
        self.email      = try map.value("email")
        self.phone      = try map.value("phone")
        self.location   = try map.value("location")
        self.birthdate  = try map.value("birthdate", using: DateTransform())
        self.createdAt  = try map.value("createdAt", using: DateTransform())
        self.identifier = try map.value("identifier")
    }
    
    // Model -> JSON
    public func mapping(map: Map) {
        id          >>> (map["_id"])
        name        >>> (map["name"])
        email       >>> (map["email"])
        phone       >>> (map["phone"])
        location    >>> (map["location"])
        createdAt   >>> (map["birthdate"], DateTransform())
        createdAt   >>> (map["createdAt"], DateTransform())
        identifier  >>> (map["identifier"])
    }
}
