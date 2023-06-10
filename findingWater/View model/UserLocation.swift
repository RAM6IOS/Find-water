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
import Firebase
import FirebaseAuth



class UserLocation : ObservableObject {
    
    //@Published var  user = [User]()
    @Published var modified = false
    /*
    init(user: User = User(usr: "")) {
        self.user = user
        
        self.$user
          .dropFirst()
          .sink { [weak self] user in
            self?.modified = true
          }
          //.store(in: &self.cancellables)
      }
    */
    func addUser( user:String){
        
        let data = ["uid": UUID(),
                                "name":user,
        ] as [String : Any]
        do {
            let _ = try Firestore.firestore().collection("user").document()
                .setData(data) { error in
                    if let error = error {
                      //  completion(false)
                        return
                    }
                    //completion(true)
                }
            
            }
            catch {
              print(error)
            }
        
        
    }
    
}



struct DocData: Identifiable, Decodable ,Hashable  {
    @DocumentID var id: String?
    let  name : String
    let dateAdded: Timestamp
    let address : String
    let value : Bool
}

class BookViewModel: ObservableObject {
    
    @Published var location = [DocData]()

    func createRestaurant() {
       // guard let uid = Auth.auth().currentUser?.uid else { return }
        let docData: [String: Any] = [
           // "uid": uid,
            "name": "PoutineFiesta",
            "address": "1234 Restaurant St",
            "dateAdded": Timestamp(date: Date()),
            "value":false
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
    
    func EditProducti(id:String ,value:Bool){
        Firestore.firestore().collection("Restaurants").document(id)
            .updateData(["value":value
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
