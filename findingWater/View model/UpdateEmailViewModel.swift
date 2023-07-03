//
//  UpdateEmailViewModel.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 2/7/2023.
//

import Foundation
import Firebase
import FirebaseAuth
class  UpdateEmailViewModel: ObservableObject {
    func updateEmail(newEmail: String, password: String, id:String, email:String) {
        let user = Auth.auth().currentUser
        // Prompt the user to reauthenticate
        let credential = EmailAuthProvider.credential(withEmail: user?.email ?? "medsmewd,rewd", password:password)
        user?.reauthenticate(with: credential) { authResult, error in
            if let error = error {
                // Handle the reauthentication error
                print("Error reauthenticating user: \(error.localizedDescription)")
            } else {
                // Reauthentication successful, update the email
                user?.updateEmail(to: newEmail) { error in
                    if let error = error {
                        // Handle the update email error
                        print("Error updating email: \(error.localizedDescription)")
                    } else {
                        // Email updated successfully
                        print("Email updated successfully")
                        self.editProducti(id: id, email: email)
                    }
                }
            }
        }
    }
    func editProducti(id: String, email: String) {
        Firestore.firestore().collection("users").document(id)
            .updateData(["email": email
                        ]) { _ in
            }
    }
}
