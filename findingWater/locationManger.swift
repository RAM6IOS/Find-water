//
//  locationManger.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 13/2/2023.
//

import Foundation
import MapKit
import CoreLocation
import CoreLocationUI

final class locationManger: NSObject, ObservableObject , CLLocationManagerDelegate {
    
    @Published  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916 ,longitude: 3.108917), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    let locationManger =  CLLocationManager()
    override init() {
        super.init()
        locationManger.delegate = self
    }
    
    func requesAllowOnceLocationPermission(){
        
        locationManger.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else{
            return
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate , span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
        }
    }
    
    func locationManager(_ manager:CLLocationManager , didFailWithError erroe:Error){
        print(erroe.localizedDescription)
        
    }
    
}
