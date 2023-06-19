//
//  sources.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 6/4/2023.
//

import Foundation

import Firebase
import FirebaseFirestoreSwift
import CoreLocation


struct sources: Identifiable ,Codable ,Hashable {
    
    @DocumentID var id: String?
    var name: String
    var adresser:String
    var location: GeoPoint
    //let latitude: Double
    //let longitude: Double
    //var image:String
    var user : [String]
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case adresser
      case location
      case user
      //case latitude
     // case longitude
      //case image
      
    }
    
   
    
}



