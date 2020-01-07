//
//  TimeInterval.swift
//  ExtensionUtil
//
//  Created by Bilal Saeed on 11/26/19.
//  Copyright © 2019 CodesOrbit. All rights reserved.
//

import Foundation

public extension TimeInterval {
    
    /**
     Get formatted time interval in format of HH:MM:SS
     
     - Returns: **TimeInterval** formatted in format of HH:mm:ss of type **String** | **TimeInterval** formatted in format of mm:ss (if time interval is less than a hour) of type **String**
     */
    
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        if hours != 0 {
            return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
        } else {
            return String(format: "%0.2d:%0.2d",minutes,seconds)
        }
    }
}
