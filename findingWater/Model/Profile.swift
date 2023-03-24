//
//  Profile.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 24/3/2023.
//

import Foundation
import CloudKit

struct Profile {
    static let kFirstName   = "firstname"
    static let kLastName    = "lastname"
    static let kAvatar      = "avatar"
    static let isCheckedin = "isCheckedin"
    
    let ckRecordID: CKRecord.ID
    let firstname: String
    let lastname: String
    let avatar: CKAsset!
    let isCheckedin: CKRecord.Reference? = nil
    
    init(record: CKRecord) {
        ckRecordID  = record.recordID
        firstname   = record[Profile.kFirstName] as? String ?? "N/A"
        lastname    = record[Profile.kLastName] as? String ?? "N/A"
        avatar      = record[Profile.kAvatar] as? CKAsset
        
            }
}
