//
//  AssociationService.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Alamofire

public class AssociationService: RequestService<Association> {

    public static let `default` = AssociationService()
    
    let ROUTE_BASE = "associations"
    
    private override init () {
        // code...
    }
    
    public func findAll(complete: @escaping ([Association]) -> Void) {
        
        let route: String = self.API_DEFAULT + self.ROUTE_BASE
        
        self.findAll(address: route) { (associations) in
            
            complete(associations)
        }
    }
}
