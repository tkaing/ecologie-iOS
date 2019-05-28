//
//  UserServices.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Alamofire

public class UserService: RequestService<Member>  {
    
    public static let `default` = UserService()
    
    let ROUTE_BASE = "users/"
    
    private override init () {
        // code...
    }
    
     public func create(member: Member, complete: @escaping (Int) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE
        
        self.create(address: route, object: member) { (status) in
            
            complete(status)
        }
    }
    
    public func update(member: Member, complete: @escaping (Int) -> Void) {
        
        guard let identifier = member.id else {
            print("id is nil")
            return
        }
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + identifier
        
        self.update(address: route, object: member) { (status) in
            
            complete(status)
        }
    }



    
    
    
}
