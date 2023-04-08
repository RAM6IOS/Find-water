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
 


