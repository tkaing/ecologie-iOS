//
//  Course.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Course: ImmutableMappable {
    
    var id: String?
    var theme: String;
    var endOn: Date;
    var startOn: Date;
    var location: String;
    var createdAt: Date;
    
    // 1 | Initializer
    init(id: String, startOn: Date, endOn: Date, theme: String, location: String, createdAt: Date) {
        self.theme = theme
        self.endOn = endOn
        self.startOn = startOn
        self.location = location
        self.createdAt = createdAt
    }
    
    // 2 | Initializer
    init(startOn: Date, endOn: Date, theme: String, location: String, createdAt: Date) {
        self.theme = theme
        self.endOn = endOn
        self.startOn = startOn
        self.location = location
        self.createdAt = createdAt
    }
    
    // JSON -> Model
    public init(map: Map) throws {
        self.id         = try map.value("_id")
        self.theme      = try map.value("theme")
        self.location   = try map.value("location")
        self.endOn      = try map.value("endOn", using: DateTransform())
        self.startOn    = try map.value("startOn", using: DateTransform())
        self.createdAt  = try map.value("createdAt", using: DateTransform())
    }
    
    // Model -> JSON
    public mutating func mapping(map: Map) {
        id          >>> (map["_id"])
        theme       >>> (map["theme"])
        location    >>> (map["location"])
        endOn       >>> (map["endOn"], DateTransform())
        startOn     >>> (map["startOn"], DateTransform())
        createdAt   >>> (map["createdAt"], DateTransform())
    }
}
