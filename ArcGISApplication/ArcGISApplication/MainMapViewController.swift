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

class MainMapViewController: UIViewController {
    
    
    @IBOutlet weak var myMap: AGSMapView!
    
    override func viewDidLoad() {
        print("\n\nMainMapViewController.swift\n\n")
        
        myMap.map = AGSMap(basemapType: .imageryWithLabels, latitude: 35.3050, longitude: -120.6625, levelOfDetail: 16)
        
    }
    
    
}
