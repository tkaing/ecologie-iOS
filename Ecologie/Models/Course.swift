//
//  Course.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation
import ObjectMapper

struct Course : ImmutableMappable {
    
    var startOn: Date;
    var endOn: Date;
    var theme: String;
    var location: String;
    var createdAt: Date;
    
    init(map: Map) throws {
        self.startOn = try map.value("startOn")
        self.endOn = try map.value("endOn")
        self.theme = try map.value("theme")
        self.location = try map.value("location")
        self.createdAt = try map.value("createdAt", using: Course.buildDateTransformer())
    }
    
    static func buildDateTransformer() -> DateFormatterTransform {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return DateFormatterTransform(dateFormatter: dateFormatter)
    }
    
    mutating func mapping(map: Map) {
        startOn >>> map["startOn"]
        endOn >>> map["endOn"]
        theme >>> map["theme"]
        location >>> map["location"]
        createdAt >>> (map["createdAt"], Course.buildDateTransformer())
    }
    
    init(startOn: Date, endOn: Date, theme: String, location: String, createdAt: Date) {
        self.startOn = startOn
        self.endOn = endOn
        self.theme = theme
        self.location = location
        self.createdAt = createdAt
    }
    
    
}
