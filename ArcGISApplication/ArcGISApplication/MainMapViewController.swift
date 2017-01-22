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
    var samplePoints = [locationPointer]()
    
    @IBOutlet weak var myMap: AGSMapView!
    @IBOutlet weak var alertsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
        print("\n\nMainMapViewController.swift\n\n")
        setCurrentLocation()
        preloadPointers()
        initDateAndMap()
        
        print("samplePoints: \(samplePoints)")
        addPicMarkers(array: samplePoints)
        addPicMarkerSymbol(imgName: "currentLocationIcon", coord: currentLocation.coordinate)

    }
    
    @IBAction func alertsButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("alertSelectVC")
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("descriptionVC")
    }
    
    func setCurrentLocation() {
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            currentLocation = locManager.location!
        }
    }
    
    func preloadPointers() {
        samplePoints.append(locationPointer(lat: currentLocation.coordinate.latitude + 0.000062437, long: currentLocation.coordinate.longitude + 0.000932432, type: "Ambulance"))
        samplePoints.append(locationPointer(lat: currentLocation.coordinate.latitude - 0.0003129, long: currentLocation.coordinate.longitude - 0.000469, type: "Firetruck"))
        samplePoints.append(locationPointer(lat: currentLocation.coordinate.latitude + 0.00032904, long: currentLocation.coordinate.longitude + 0.00048946, type: "Police"))
        samplePoints.append(locationPointer(lat: currentLocation.coordinate.latitude + 0.000983420, long: currentLocation.coordinate.longitude - 0.00012345, type: "Natural Disaster"))
        samplePoints.append(locationPointer(lat: currentLocation.coordinate.latitude - 0.0009876, long: currentLocation.coordinate.longitude + 0.00096586, type: "Police"))
    }
    
    func initDateAndMap() {
        hour = NSCalendar.current.component(.hour, from: date as Date)
        locManager.requestWhenInUseAuthorization()
        
        print("Latitude: \(currentLocation.coordinate.latitude)\t Longitude: \(currentLocation.coordinate.longitude)")
        print("\nHour: \(hour)")
        
        if hour > 7 && hour < 17 {  //daytime
            basemap = AGSBasemapType.streets
        } else {
            basemap = AGSBasemapType.streetsNightVector
        }
        
        myMap.map = AGSMap(basemapType: basemap!, latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, levelOfDetail: 16)
        
        self.myMap.graphicsOverlays.add(self.graphicsOverlay)
        

    }
    
    func addPicMarkers(array: [locationPointer]) {

        addPicMarkerSymbol(imgName: array[0].myPic(), coord: CLLocationCoordinate2D(latitude: array[0].latitude, longitude: array[0].longitude))
        addPicMarkerSymbol(imgName: array[1].myPic(), coord: CLLocationCoordinate2D(latitude: array[1].latitude, longitude: array[1].longitude))
        addPicMarkerSymbol(imgName: array[2].myPic(), coord: CLLocationCoordinate2D(latitude: array[2].latitude, longitude: array[2].longitude))
        addPicMarkerSymbol(imgName: array[3].myPic(), coord: CLLocationCoordinate2D(latitude: array[3].latitude, longitude: array[3].longitude))
        addPicMarkerSymbol(imgName: array[4].myPic(), coord: CLLocationCoordinate2D(latitude: array[4].latitude, longitude: array[4].longitude))

    }
    
    private func addPicMarkerSymbol(imgName: String, coord: CLLocationCoordinate2D) {
        let pinSymbol = AGSPictureMarkerSymbol(image: UIImage(named: imgName)!)
        pinSymbol.width = 20
        pinSymbol.height = 20
        pinSymbol.offsetY = pinSymbol.image!.size.height/2
        
        let pinPoint = AGSPoint(clLocationCoordinate2D: coord)
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
