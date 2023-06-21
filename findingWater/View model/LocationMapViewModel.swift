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
    @Published var user: Array = [UserHere]()
    init() {
        fetchDataWaterSource()
    }
    // This function will fetch Data from firebase that match the structure userHere
    func userInWaterLocation(mdel: String) {
        Firestore.firestore().collection(mdel).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.user  = documents.compactMap { (queryDocumentSnapshot) -> UserHere? in
                return try? queryDocumentSnapshot.data(as: UserHere.self)
            }
        }
    }
    // This function will remove user item that matches id in userHere
    func rmoveUser(id: String, user: String) {
        Firestore.firestore().collection(user).document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    // This function will create new new item
    func createRestaurant(mdel: String) {
        let docData: [String: Any] = [
            "name": "PoutineFiesta",
            "address": "1234 Restaurant St"
        ]
        let docRef = Firestore.firestore().collection(mdel).document()
        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
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
