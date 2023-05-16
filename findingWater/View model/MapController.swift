//
//  MapController.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/4/2023.
//

import Foundation
import MapKit

class MapController:  NSObject, ObservableObject, CLLocationManagerDelegate {
    var searchTern  = String()
    @Published  var isBusinessViewShowing = false
    @Published private(set) var businesses = [Business]()
    @Published private(set) var  selectedBusiness : Business?
    @Published private(set) var  actions = [Action]()
    @Published var locations = [
    Location2(name: "-1", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), free: true),
    Location2(name: "0", coordinate: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.158917), free: false),
    Location2(name: "1", coordinate: CLLocationCoordinate2D(latitude: 36.553840, longitude: 3.114948), free: true),
    Location2(name: "2", coordinate: CLLocationCoordinate2D(latitude: 36.553899, longitude: 3.118301), free: true),
    Location2(name: "4", coordinate: CLLocationCoordinate2D(latitude: 36.552798, longitude: 3.108479), free: true),
    Location2(name: "5", coordinate: CLLocationCoordinate2D(latitude: 36.550966, longitude: 3.103164), free: false),
    Location2(name: "6", coordinate: CLLocationCoordinate2D(latitude: 36.553187, longitude: 3.108679), free: true),
    Location2(name: "7", coordinate: CLLocationCoordinate2D(latitude: 36.567564, longitude: 3.158442), free: true),
    Location2(name: "8", coordinate: CLLocationCoordinate2D(latitude: 36.546298, longitude: 3.093918), free: true),
    Location2(name: "9", coordinate: CLLocationCoordinate2D(latitude: 36.543958, longitude: 3.088122), free: true),
    Location2(name: "10", coordinate: CLLocationCoordinate2D(latitude: 36.540878, longitude: 3.080164), free: true),
    //Location2(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 36.544944, longitude: 3.074616), free: true)
    ]
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let locationManger =  CLLocationManager()
    override init() {
        super.init()
        locationManger.delegate = self
    }
    
    func requesAllowOnceLocationPermission(){
        
        locationManger.requestLocation()
    }
    
    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else{
            return
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate , span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
        }
    }
    
    nonisolated func locationManager(_ manager:CLLocationManager , didFailWithError erroe:Error){
        print(erroe.localizedDescription)
        
    }
    
    var selectedBusinessName : String {
        guard let selectedBusiness = selectedBusiness else { return ""}
        return selectedBusiness.name
    }
    
    var selectedBusinessplacemark : String {
        guard let selectedBusiness = selectedBusiness else { return ""}
        return selectedBusiness.placemark.title ?? "??"
    }
    
    func Search(){
        let request = MKLocalSearch.Request()
        
        request.naturalLanguageQuery = searchTern
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start{ [self] response ,error in
            guard let response = response else{return}
            
            
            DispatchQueue.main.async {
                self.businesses =  response.mapItems.map{ item in
                    Business(name: item.name ?? "", placemark: item.placemark , coordinate: item.placemark.coordinate, phoneNumber: item.phoneNumber ?? "" , Website: item.url)
                    
                }
            }
            self.creatnActions()
        }
        
    }
    

    func openMap(coordinate:CLLocationCoordinate2D){
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
        
    }
    func setSelectedBusiness(for businesses:Business){
        selectedBusiness = businesses
        isBusinessViewShowing.toggle()
        
        
    }
    func creatnActions(){
        actions = [
            Action(title: "Direction", image: "car.fill") { [weak self] in
                guard let self = self else {return}
                self.openMap(coordinate: self.selectedBusiness!.coordinate)
                
                
            },
            Action(title: "Direction", image: "phone.fill") { [weak self] in
                guard let self = self else {return}
                guard let phoneNumber = self.selectedBusiness?.phoneNumber else {return}
                guard let url = URL(string:self.convertPhoneNumberFormat(phoneNumber: phoneNumber) ) else {return}
                        UIApplication.shared.open(url)
                //self.openMap(coordinate: self.selectedBusiness!.coordinate)
                
                
            },
            Action(title: "Direction", image: "safari.fill") { [weak self] in
                guard let self = self else {return}
                guard let Website = self.selectedBusiness?.Website else {return}
               // guard let url = URL(string:self.convertPhoneNumberFormat(phoneNumber:phoneNumber) )
                        UIApplication.shared.open(Website)
                //self.openMap(coordinate: self.selectedBusiness!.coordinate)
                
                
            },
        ]
    }
    func convertPhoneNumberFormat(phoneNumber:String) -> String{
        let strippedPhoneNumber = phoneNumber
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        
        return "tel//\(strippedPhoneNumber)"
        
    }
    
}
