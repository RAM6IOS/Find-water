//
//  MapController.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/4/2023.
//

import Foundation
import MapKit

class MapController: ObservableObject {
    var searchTern  = String()
    @Published  var isBusinessViewShowing = false
    @Published private(set) var businesses = [Business]()
    @Published private(set) var  selectedBusiness : Business?
    @Published private(set) var  actions = [Action]()
    
    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
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
            Action(title: "Direction", image: "car.fill") { [weak self] in
                guard let self = self else {return}
                guard let phoneNumber = self.selectedBusiness?.phoneNumber else {return}
                guard let url = URL(string:self.convertPhoneNumberFormat(phoneNumber: phoneNumber) ) else {return}
                        UIApplication.shared.open(url)
                //self.openMap(coordinate: self.selectedBusiness!.coordinate)
                
                
            },
            Action(title: "Direction", image: "car.fill") { [weak self] in
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
