//
//  UserLocation.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/5/2023.
//

import Foundation
import Firebase
import UIKit
import FirebaseAuth


class UserLocation : ObservableObject {
    
    @Published var  user = [User]()
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


class BookViewModel: ObservableObject {
    
    @Published var location = [DocData]()
    /*
     @Published var book: Book
     @Published var modified = false
     //private var cancellables = Set<AnyCancellable>()
     init(book: Book = Book(title: "d", author: "d", numberOfPages: 0)) {
     self.book = book
     
     self.$book
     .dropFirst()
     .sink { [weak self] book in
     self?.modified = true
     }
     //.store(in: &self.cancellables)
     }
     
     private var db = Firestore.firestore()
     
     private func addBook(book: Book) {
     do {
     let _ = try db.collection("books").addDocument(from: book)
     }
     catch {
     print(error)
     }
     }
     
     func save(){
     addBook(book:book)
     }
     */
    
    
    func createRestaurant() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let docData: [String: Any] = [
            "uid": uid,
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
