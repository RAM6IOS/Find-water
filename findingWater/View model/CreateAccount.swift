//
//  CreateAccount.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/6/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestore
import Firebase
//import FirebaseStorage

class CreateAccount: ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser: User2?

    //@Published var user = [User2]()
    
    init() {
                self.userSession = Auth.auth().currentUser
                //self.fetchUser()
        
             print(userSession)
            }
    
    func login(withEmail email: String, password: String) {
               Auth.auth().signIn(withEmail: email, password: password) { result, error in
                   if let error = error {
                       print("DEBUG: Failed to register with error \(error.localizedDescription)")
                       return
                   }
                   guard let user = result?.user else { return }
                   self.userSession = user
                   //self.fetchUser()
                   print("DEBUG: Did Log user in.. \(String(describing: self.userSession?.email))")
               }
           }
    func register(withEmail email: String, password: String, name: String ) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
                        self.userSession = user
           
                        let userData = ["email": email,
                                                    "name": name,
                                                    "uid": user.uid]
                        Firestore.firestore().collection("users")
                                        .document(user.uid)
                                        .setData(userData) { _ in
                                        }
                        
                    }
        print(self.userSession)
        }
    }

