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
    @Published var books = [Sources]()
    
    init() {
        fetchData()
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
        fetchData()
        
    }
    func EditProducti(id:String ,user:String){
        Firestore.firestore().collection("sources").document(id)
            .updateData(["user":FieldValue.arrayUnion([user])
                        ]) { _ in
            }
        fetchData()
        
    }
    
    /*
    func createRestaurant() {
       // guard let uid = Auth.auth().currentUser?.uid else { return }
        let docData: [String: Any] = [
           // "uid": uid,
           
            "user":[String]()
        ]
        let db = Firestore.firestore()
        
        let docRef = db.collection("sources").document()
        
        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
     */
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
 


