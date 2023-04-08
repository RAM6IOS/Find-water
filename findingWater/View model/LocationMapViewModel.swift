//
//  LocationMapViewModel.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 6/4/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import CoreLocation

struct Book: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  var author: String
  var numberOfPages: Int
}

struct Book2: Identifiable, Codable {
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



class LocationMapViewModel: ObservableObject {
    @Published var books = [Sources]()
    
    init() {
        fetchData()
    }
    func fetchData() {
        
        let db = Firestore.firestore()
                    db.collection("sources").addSnapshotListener { (querySnapshot, error) in
                        guard let documents = querySnapshot?.documents else {
                          print("No documents")
                          return
                        }

                        self.books = documents.compactMap { (queryDocumentSnapshot)-> Sources? in
                            return try? queryDocumentSnapshot.data(as:Sources.self)
                        }
                    }
        
        
    }
}
 


