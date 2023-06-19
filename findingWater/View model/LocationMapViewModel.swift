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

struct userHere: Identifiable, Decodable ,Hashable  {
    @DocumentID var id: String?
    let  name : String
    let address : String
    
}

class LocationMapViewModel: ObservableObject {
    @Published var source:Array = [sources]()
    @Published var user:Array = [userHere]()
    
    init() {
        fetchDataWaterSource()
    }
    // This function will fetch Data from firebase that match the structure userHere
    func userInWaterLocation(mdel:String){
        let db = Firestore.firestore()
        db.collection(mdel).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.user  = documents.compactMap { (queryDocumentSnapshot)-> userHere? in
                return try? queryDocumentSnapshot.data(as:userHere.self)
            }
        }
    }
    //This function will remove user item that matches id in userHere
    func rmoveUser(id:String ,user:String){
        Firestore.firestore().collection(user).document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    // This function will create new new item
    func createRestaurant(mdel:String) {
        let docData: [String: Any] = [
            "name": "PoutineFiesta",
            "address": "1234 Restaurant St"
        ]
        let db = Firestore.firestore()
        let docRef = db.collection(mdel).document()
        
        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func rmove(id:String ,user:String){
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user":FieldValue.arrayRemove([user])
                        ]) { _ in
            }
    }
    
    func EditProducti(id:String ,value:String){
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user":[value]
                        ]) { _ in
            }
        fetchDataWaterSource()
        
    }
    func EditProducti(id:String ,user:String){
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user":FieldValue.arrayUnion([user])
                        ]) { _ in
            }
        fetchDataWaterSource()
        
    }
    //This function will fetch Data from firebase that match the structure Sources
    func fetchDataWaterSource() {
        let db = Firestore.firestore()
                    db.collection("sources").addSnapshotListener { (querySnapshot, error) in
                        guard let documents = querySnapshot?.documents else {
                          print("No documents")
                          return
                        }
                        self.source = documents.compactMap { (queryDocumentSnapshot)-> sources? in
                            return try? queryDocumentSnapshot.data(as:sources.self)
                        }
                    }
    }
}
 


