//
//  MainMapViewController.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/21/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit
import ArcGIS

class MainMapViewController: UIViewController, CLLocationManagerDelegate {
    
    var locManager = CLLocationManager()
    var currentLocation = CLLocation()
    
    @IBOutlet weak var myMap: AGSMapView!
    
    override func viewDidLoad() {
        print("\n\nMainMapViewController.swift\n\n")
        
        locManager.requestWhenInUseAuthorization()
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            
            currentLocation = locManager.location!
        }
        
        print("Latitude: \(currentLocation.coordinate.latitude)\t Longitude: \(currentLocation.coordinate.longitude)")
        
        myMap.map = AGSMap(basemapType: .imageryWithLabels, latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, levelOfDetail: 16)
        
    }
    
    
}
