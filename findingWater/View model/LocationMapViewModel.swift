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


class LocationMapViewModel: ObservableObject {
    @Published var source: Array = [Sources]()
    init() {
        fetchDataWaterSource()
    }    
    func rmove(id: String, user: String) {
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user": FieldValue.arrayRemove([user])
                        ]) { _ in
            }
    }
    func editProducti(id: String, value: String) {
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user": [value]
                        ]) { _ in
            }
        fetchDataWaterSource()
    }
    func editProducti(id: String, user: String) {
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user": FieldValue.arrayUnion([user])
                        ]) { _ in
            }
        fetchDataWaterSource()
    }
    // This function will fetch Data from firebase that match the structure Sources
    func fetchDataWaterSource() {
        Firestore.firestore().collection("sources").addSnapshotListener { (querySnapshot, error) in
                        guard let documents = querySnapshot?.documents else {
                          print("No documents")
                          return
                        }
                        self.source = documents.compactMap { (queryDocumentSnapshot) -> Sources? in
                            return try? queryDocumentSnapshot.data(as: Sources.self)
                        }
                    }
    }
}
