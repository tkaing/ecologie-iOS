//
//  CourseService.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Alamofire

public class CourseService: RequestService<Course> {
    
    public static let `default` = CourseService()
    
    let ROUTE_BASE = "courses/"
    
    private override init () {
        // code...
    }
    
    public func create(course: Course, complete: @escaping (Int) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE
        
        self.create(address: route, object: course) { (status) in
            
            complete(status)
        }
    }
    
    public func find(id: String, complete: @escaping (Course) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + id
        
        self.find(address: route) { (course) in
            
            complete(course)
        }
    }
    
    public func findAll(complete: @escaping ([Course]) -> Void) {
        
        let route = self.API_DEFAULT + self.ROUTE_BASE
        
        self.findAll(address: route) { (courses) in
            
            complete(courses)
        }
    }
    
    public func update(course: Course, complete: @escaping (Int) -> Void) {
        
        guard let identifier = course.id else {
            print("id is nil")
            return
        }
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + identifier
        
        self.update(address: route, object: course) { (status) in
            
            complete(status)
        }
    }
    
    public func delete(course: Course, complete: @escaping (Int) -> Void) {
        
        guard let identifier = course.id else {
            print("id is nil")
            return
        }
        
        let route = self.API_DEFAULT + self.ROUTE_BASE + identifier
        
        self.delete(address: route) { (status) in
            
            complete(status)
        }
    }
}

