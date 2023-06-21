//
//  User.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/5/2023.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth

/*
struct User : Identifiable, Codable {
    @DocumentID var id: String?
    var usr: String
}
*/
struct Book: Identifiable, Codable {
  @DocumentID var id: String?
  var title: String
  var author: String
  var numberOfPages: Int
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case author
    case numberOfPages = "pages"
  }
}

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var email: String
    var value: Bool
    var isCurrantUser: Bool { return Auth.auth().currentUser?.uid == id }

}
