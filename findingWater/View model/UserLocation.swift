//
//  UserLocation.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/5/2023.
//

import Foundation
import Firebase
import UIKit
import FirebaseFirestoreSwift
import FirebaseAuth

class UserLocation: ObservableObject {

    @Published var modified = false
    func addUser( user:String) {
        let data = ["uid": UUID(),
                "name": user,
        ] as [String: Any]
        do {
            let _ = try Firestore.firestore().collection("user").document()
                .setData(data) { error in
                    if let error = error {
                        return
                    }
                }
            }
            catch {
              print(error)
            }
    }
}


struct DocData: Identifiable , Decodable , Hashable  {
    @DocumentID var id: String?
    let  name: String
    let dateAdded: Timestamp
    let address: String
    let value: Bool
}

class BookViewModel: ObservableObject {
    @Published var location = [DocData]()
    func createRestaurant() {
        let docData: [String: Any] = [
            "name": "PoutineFiesta",
            "address": "1234 Restaurant St",
            "dateAdded": Timestamp(date: Date()),
            "value": false
        ]
        let db = Firestore.firestore()
        let docRef = db.collection("Restaurants").document()
        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func fetchData(){
        let db = Firestore.firestore()
        db.collection("Restaurants").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.location  = documents.compactMap { (queryDocumentSnapshot)-> DocData? in
                return try? queryDocumentSnapshot.data(as:DocData.self)
            }
        }
    }
    func editProducti(id:String ,value:Bool){
        Firestore.firestore().collection("Restaurants").document(id)
            .updateData(["value": value
                        ]) { _ in
            }
    }
    func excluirDaAgenda(documento: String) {
        Firestore.firestore().collection("Restaurants").document(documento).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}
