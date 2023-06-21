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
    var phone: String
    var tankVolume: String
    var vehicleNumber: String
    var vehicleModel: String
    enum CodingKeys: String, CodingKey  {
     case id
      case name
      case phone
      case tankVolume
      case vehicleNumber
      case vehicleModel
    }
}
