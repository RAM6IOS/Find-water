//
//  waterTank.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 8/4/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import CoreLocation


struct watertTank:Identifiable ,Codable{
    @DocumentID var id: String?
    var name: String
    var phonemumber:String
    var tankvolume:Int
    var carnumber: String
    var truckname:String
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case phonemumber
      case tankvolume
       case carnumber
       case truckname
      
      
    }
    
    
    
}
