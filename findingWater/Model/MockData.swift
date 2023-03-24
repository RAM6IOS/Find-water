//
//  MockData.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 24/3/2023.
//

import Foundation
import CloudKit

struct MockData {
static var location: CKRecord {
        let record = CKRecord(recordType: "Location")
        record[Location.kName]           = "Sean's Bar and Grill"
        record[Location.kAddress]        = "123 Main Street"
        record[Location.kLocation]       = CLLocation(latitude: 37.331516, longitude: -121.891054)
        return record
    }
}
