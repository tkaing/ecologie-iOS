//
//  AssociationService.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Alamofire

public class AssociationService: ObjectService {

    public static let `default` = AssociationService()
    
    let ROUTE_DEFAULT = "associations"
    
    private override init () {
        // code...
    }
    
    public func findAll(complete: @escaping ([Association]) -> Void) {
        
        let route: String = self.API_DEFAULT + self.ROUTE_DEFAULT
        
        var associations: [Association] = []
        
        self.findAll(address: route) { (objects) in
            
            for object in objects {
                
                guard let association = (try? Association(JSON: object))
                else { return }
                
                associations.append(association)
            }
            
            complete(associations)
        }
    }
}
