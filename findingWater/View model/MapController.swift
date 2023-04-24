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
    @Published private(set) var  Actions = [Action]()
    
    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var selectedBusinessName : String {
        guard let selectedBusiness = selectedBusiness else { return ""}
        return selectedBusiness.name
    }
    
    var selectedBusinessplacemark : String {
        guard let selectedBusiness = selectedBusiness else { return ""}
        return selectedBusiness.placemark.title ?? "??"
    }
    


    
}
