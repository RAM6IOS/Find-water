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

class CreateAccount: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var showOnbord: Bool = false
   // user information
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var name: String = ""
    init() {
                self.userSession = Auth.auth().currentUser
            self.fetchUser()
            }
    func login(withEmail email: String, password: String) {
               Auth.auth().signIn(withEmail: email, password: password) { result, error in
                   if let error = error {
                       print("DEBUG: Failed to register with error \(error.localizedDescription)")
                       return
                   }
                   guard let user = result?.user else { return }
                   self.userSession = user
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
                                                    "value": false,
                                                    "uid": user.uid]
                        Firestore.firestore().collection("users")
                                        .document(user.uid)
                                        .setData(userData) { _ in
                                        }
            self.fetchUser()
                    }
        }
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
            Firestore.firestore().collection("users")
                .document(uid)
                .getDocument { snapshot, _ in
                    guard  let  snapshot = snapshot else { return }
                    guard let user = try? snapshot.data(as: User.self) else { return }
                    completion(user)
                }
        }
    func logout() {
        do {
            self.userSession = nil
            try? Auth.auth().signOut()
        } catch let signOutError as NSError  {
            print("Error signing out: %@", signOutError)
        }
               
           }
    func delete() {
           Auth.auth().currentUser?.delete{ error in
             if let error = error {
               print(error)
             } else {
                 self.userSession = nil
             }
           }
           }
    func editProducti(id: String, value: Bool) {
        Firestore.firestore().collection("users").document(id)
            .updateData(["value": value
                        ]) { _ in
            }
    }
    }
