//
//  ObjectService.swift
//  Ecologie
//
//  Created by Thierry Kg on 09/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Alamofire
import ObjectMapper

public class RequestService<T: ImmutableMappable>
{
    let API_DEFAULT = "http://localhost:3000/"
    
    func create(address: String, object: T, complete: @escaping (T) -> Void) {
        
        Alamofire.request(address, method: .put, parameters: object.toJSON(), encoding: JSONEncoding.default).response { result in
            
            //completion(res.response?.statusCode == 201)
        }
    }
    
    func find(address: String, complete: @escaping (T) -> Void) {
       
        Alamofire.request(address).responseJSON { (request) in
            
            guard let item = request.value as? [String: Any]
            else { return }
            
            guard let object = (try? T(JSON: item))
            else { return }
            
            // Execute callback / closure
            complete(object)
        }
    }
    
    func findAll(address: String, complete: @escaping ([T]) -> Void) {
        
        var objects: [T] = []
        
        Alamofire.request(address).responseJSON { (request) in
            
            guard let items = request.value as? [[String: Any]]
                else { return }
            
            for item in items {
                
                guard let object = (try? T(JSON: item))
                    else { return }
                
                objects.append(object)
            }
            
            // Execute callback / closure
            complete(objects)
        }
    }
    
    func update(address: String, complete: @escaping (T) -> Void) {
        
    }
    
    func delete(address: String, complete: @escaping (Bool) -> Void) {
        var result : Bool = false
        Alamofire.request(address , method: .delete)
            .responseJSON { response in
             
                    if let httpStatusCode = response.response?.statusCode {
                        switch(httpStatusCode) {
                            case 200:
                                result = true
                            case 422:
                                print("Association not founds")
                            case 500:
                                print("API Error")
                            default:
                                print("Error")
                        }
                    }
                // Execute callback / closure
                complete(result)
        }
       
    }
}
