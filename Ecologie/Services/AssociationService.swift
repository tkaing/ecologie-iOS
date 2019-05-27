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
    
    let ROUTE_BASE = "associations/"
    
    private override init () {
        // code...
    }
    
    public func create(association: Association, complete: @escaping (Int) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE
        
        self.create(address: route, object: association) { (status) in
            
            complete(status)
        }
    }
    
    public func find(id: String, complete: @escaping (Association) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + id
        
        self.find(address: route) { (association) in
            
            complete(association)
        }
    }
    
    public func findAll(complete: @escaping ([Association]) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE
        
        self.findAll(address: route) { (associations) in
            
            complete(associations)
        }
    }
    
    public func update(association: Association, complete: @escaping (Int) -> Void) {
        
        guard let identifier = association.id else {
            print("id is nil")
            return
        }
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + identifier
        
        self.update(address: route, object: association) { (status) in
            
            complete(status)
        }
    }

    public func delete(association: Association, complete: @escaping (Int) -> Void) {
        
        guard let identifier = association.id else {
            print("id is nil")
            return
        }
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + identifier
        
        self.delete(address: route) { (status) in
            
            complete(status)
        }
    }
}
