//
//  MemberModel.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation
import ObjectMapper

struct MemberModel: ImmutableMappable {

 
  
    
    var email: String;
    var firstname: String;
    var lastname: String;
    var birthdate: Date;
    var phone: String;
    var location: String;
    var createdAt: Date;
    
    init(map: Map) throws {
        self.email = try map.value("email")
        self.firstname = try map.value("firstname")
        self.lastname = try map.value("lastname")
        self.birthdate = try map.value("birthdate")
        self.phone = try map.value("phone")
        self.location = try map.value("location")
        self.createdAt = try map.value("createdAt")
    }
    
    
    static func buildDateTransformer() -> DateFormatterTransform {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return DateFormatterTransform(dateFormatter: dateFormatter)
    }
    
    mutating func mapping(map: Map) {
        email >>> map["email"]
        firstname >>> map["firstname"]
        lastname >>> map["lastname"]
        birthdate >>> map["birthdate"]
        phone >>> map["phone"]
        location >>> map["location"]
        createdAt >>> (map["createdAt"], MemberModel.buildDateTransformer())
    }
    
    init(email: String, firstname: String, lastname: String, birthdate: Date, phone: String, location: String, createdAt: Date) {
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.phone = phone
        self.location = location
        self.createdAt = createdAt
    }
    
    
}
