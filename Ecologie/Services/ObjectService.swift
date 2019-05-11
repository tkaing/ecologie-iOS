//
//  ObjectService.swift
//  Ecologie
//
//  Created by Thierry Kg on 09/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Alamofire

public class ObjectService
{
    let API_DEFAULT = "http://localhost:3000/"
    
    func findAll(address: String, complete: @escaping ([[String: Any]]) -> Void)
    {
        Alamofire.request(address).responseJSON { (request) in
            
            guard let objects = request.value as? [[String: Any]]
            else { return }
            
            // Execute callback / closure
            complete(objects)
        }
    }
}
