//
//  waterLocation.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 24/3/2023.
//

import Foundation
import CloudKit

struct Location {
    static let kName    = "name"
    static let kSquareAsset = "squareAsset"
    static let kBannerAsset = "bannerAsset"
    static let kAddress     = "address"
    static let kLocation    = "location"
   
    
    let ckRecordID: CKRecord.ID
    let name: String
   
    let squareAsset: CKAsset!
    let bannerAsset: CKAsset!
    let address: String
    let location: CLLocation
   
  
    
    init(record: CKRecord) {
        ckRecordID  = record.recordID
        name        = record[Location.kName] as? String ?? "N/A"
        //description = record[DDGLocation.kDescription] as? String ?? "N/A"
        squareAsset = record[Location.kSquareAsset] as? CKAsset
        bannerAsset = record[Location.kBannerAsset] as? CKAsset
        address     = record[Location.kAddress] as? String ?? "N/A"
        location    = record[Location.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
      
      
    }
}
