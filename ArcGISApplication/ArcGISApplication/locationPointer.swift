//
//  locationPointer.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/22/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit

class locationPointer {
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var type: String = ""
    
    init(lat: Double, long: Double, type: String) {
        self.latitude = lat
        self.longitude = long
        self.type = type
        
    }
    
    func myPic() -> String {
        var str = ""
    
        switch type{
        case "Ambulance":
            str = "red"
        case "Fire Truck":
            str = "orange"
        case "Police":
            str = "blue"
        default:
            str = "graycircle"
        }
    
        return str
    }
    
}
