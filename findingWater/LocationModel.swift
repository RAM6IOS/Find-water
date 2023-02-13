//
//  LocationModel.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 13/2/2023.
//

import Foundation


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let free :Bool
}
