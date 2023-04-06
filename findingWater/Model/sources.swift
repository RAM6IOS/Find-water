//
//  sources.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 6/4/2023.
//

import Foundation
import CoreLocation

struct sources:Identifiable , Decodable{
    let id:String?
    let name:String
    let address :String
    let location:CLLocationCoordinate2D
    let image:String
    
    enum CodingKeys: String, CodingKey {
            case id
            case name
            case address
            case latitude
            case longitude
            case image
        }
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decodeIfPresent(String.self, forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.address = try container.decode(String.self, forKey: .address)
            let latitude = try container.decode(Double.self, forKey: .latitude)
            let longitude = try container.decode(Double.self, forKey: .longitude)
            self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            self.image = try container.decode(String.self, forKey: .image)
        }
    
}
