//
//  LocationListViewModel.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 9/4/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import CoreLocation

class LocationListViewModel : ObservableObject {
    @Published var location = [WaterTank]()
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        let db = Firestore.firestore()
                    db.collection(" truck").addSnapshotListener { (querySnapshot, error) in
                        guard let documents = querySnapshot?.documents else {
                          print("No documents")
                          return
                        }

                        self.location  = documents.compactMap { (queryDocumentSnapshot)-> WaterTank? in
                            return try? queryDocumentSnapshot.data(as:WaterTank.self)
                        }
                    }
    }
    
    
}


