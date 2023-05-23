//
//  Business.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/4/2023.
//

import Foundation
import MapKit

struct Business :Identifiable {
    var id = UUID()
    var name : String
    var placemark: MKPlacemark
    var coordinate: CLLocationCoordinate2D
    var phoneNumber:String
    var Website:URL?
}

struct Location3: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let free :Bool
}

