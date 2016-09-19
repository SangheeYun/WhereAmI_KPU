//
//  LocationManager.swift
//  Where-am-i
//
//  Created by 임성훈 on 2016. 9. 12..
//  Copyright © 2016년 임성훈. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    var currentLocText: UILabel!
    
    init(mapView: MKMapView, currentLocText: UILabel) {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        self.mapView = mapView
        self.mapView.showsUserLocation = true
        self.currentLocText = currentLocText
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        guard let location = locations.last else {
            print("location not founded")
            return
        }
        // 위치정보 반환
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) -> Void in // reverseGeocoding
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = (placemarks?[0])! as CLPlacemark
                self.currentLocText.text = pm.administrativeArea!+" "+pm.locality!+" "+pm.name!
            }
            else {
                print("Problem with the data received from geocoder")
            }
        }
      
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        // MKCoordinateSpan -- 지도 scale
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01))
        
        self.mapView.setRegion(region, animated: true)
        if let coor = manager.location?.coordinate{
            NSLog(String(coor.latitude)+" "+String(coor.longitude)+"\n")
        }
    }
}
