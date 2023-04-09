//
//  Water tank.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 9/4/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import CoreLocation


struct WaterTank: Identifiable ,Codable {
    
    @DocumentID var id: String?
    var name: String
    var Phone :String
    var TankVolume: String
    var VehicleNumber:String
    var VehicleModel:String
    //var image:String
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case Phone
      case TankVolume
      case VehicleNumber
      case VehicleModel
      //case latitude
     // case longitude
      //case image
      
    }
    
   
    
}

