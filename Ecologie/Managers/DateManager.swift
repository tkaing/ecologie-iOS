//
//  DateManager.swift
//  Ecologie
//
//  Created by DéjàLu on 14/07/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import Foundation

class DateManager {
    
    public static let `default` = DateManager()
    
    public func toString(date: Date, format: String = "yyyy-MM-dd HH:mm") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}
