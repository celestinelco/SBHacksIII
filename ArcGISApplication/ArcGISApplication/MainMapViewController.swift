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
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    let date = NSDate()
    var hour: Int!
    var basemap: AGSBasemapType?
    private var graphicsOverlay = AGSGraphicsOverlay()
    
    @IBOutlet weak var myMap: AGSMapView!
    @IBOutlet weak var alertsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
        print("\n\nMainMapViewController.swift\n\n")
        initDateAndMap()
    }
    
    @IBAction func alertsButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("alertSelectVC")
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("descriptionVC")
    }
    
    func initDateAndMap() {
        hour = NSCalendar.current.component(.hour, from: date as Date)
        locManager.requestWhenInUseAuthorization()
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            currentLocation = locManager.location!
        }
        
        print("Latitude: \(currentLocation.coordinate.latitude)\t Longitude: \(currentLocation.coordinate.longitude)")
        print("\nHour: \(hour)")
        
        if hour > 7 && hour < 17 {  //daytime
            basemap = AGSBasemapType.streets
        } else {
            basemap = AGSBasemapType.streetsNightVector
        }
        
        myMap.map = AGSMap(basemapType: basemap!, latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, levelOfDetail: 16)
        
        self.myMap.graphicsOverlays.add(self.graphicsOverlay)
        
        addPicMarkerSymbol(imgName: "tent")

    }
    
    private func addPicMarkerSymbol(imgName: String) {
        let pinSymbol = AGSPictureMarkerSymbol(image: UIImage(named: imgName)!)
        pinSymbol.width = 24
        pinSymbol.height = 24
        pinSymbol.offsetY = pinSymbol.image!.size.height/2
        
//        let pinPoint = AGSPoint(x: currentLocation.coordinate.latitude, y: currentLocation.coordinate.longitude, spatialReference: AGSSpatialReference.webMercator())
        let pinPoint = AGSPoint(clLocationCoordinate2D: currentLocation.coordinate)
        let graphic = AGSGraphic(geometry: pinPoint, symbol: pinSymbol, attributes: nil)
        
        self.graphicsOverlay.graphics.add(graphic)
    }
    
    /**
     Navigates storyboard to view controller with specified String name.
     - Parameter controllerName: <String> name of controller storyboard will navigate to.
     */
    func navigateToAuthenticatedViewController(_ controllerName: String){
        if let loggedInVC = storyboard?.instantiateViewController(withIdentifier: controllerName) {
            DispatchQueue.main.async { () -> Void in
                self.navigationController?.isNavigationBarHidden = true
                self.navigationController?.pushViewController(loggedInVC, animated: true)
            }
        }
    }
    
    
}
