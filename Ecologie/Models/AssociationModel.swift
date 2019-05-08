//
//  AssociationModel.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation
import ObjectMapper

struct AssociationModel: ImmutableMappable {

    
    var email: String;
    var name: String;
    var identifier: String;
    var phone: String;
    var location: String;
    var createdAt: Date;
    
    init(map: Map) throws {
        self.email = try map.value("email")
        self.name = try map.value("name")
        self.identifier = try map.value("identifier")
        self.phone = try map.value("phone")
        self.location = try map.value("location")
        self.createdAt = try map.value("createdAt")
    }
   
    
    
    static func buildDateTransformer() -> DateFormatterTransform {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return DateFormatterTransform(dateFormatter: dateFormatter)
    }
    
     func mapping(map: Map) {
        email >>> map["email"]
        name >>> map["name"]
        identifier >>> map["identifier"]
        phone >>> map["phone"]
        location >>> map["location"]
        createdAt >>> (map["createdAt"], AssociationModel.buildDateTransformer())
    }
    
    init(email: String, name: String, identifier: String, phone: String, location: String, createdAt: Date) {
        self.email = email
        self.name = name
        self.identifier = identifier
        self.phone = phone
        self.location = location
        self.createdAt = createdAt
    }
    
}
