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

struct Sources: Identifiable ,Codable {
    @DocumentID var id: String?
    var name: String
    var adresser:String
    var location: GeoPoint
    //var image:String
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case adresser
      case location
      //case latitude
     // case longitude
      //case image
      
    }
    
   
    
}



