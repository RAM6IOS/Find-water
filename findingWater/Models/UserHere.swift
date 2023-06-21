//
//  UserHere.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 21/6/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserHere: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let  name: String
    let address: String
    }
