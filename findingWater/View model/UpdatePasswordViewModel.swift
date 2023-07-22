//
//  UpdatePasswordViewModel.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 2/7/2023.
//

import Foundation
import Firebase
import FirebaseAuth

class  UpdatePasswordViewModel: ObservableObject {
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var error: Error?
    func updatePassword(newPassword: String, currentPassword: String) {
        let user = Auth.auth().currentUser

            let credential = EmailAuthProvider.credential(withEmail: user!.email!, password: currentPassword)

            user?.reauthenticate(with: credential, completion: { ( authResult, error) in
                if error != nil {
                  // Handle re-authentication error
                    print("Error reauthenticating user: \(error?.localizedDescription)")
                  return
               }
               user?.updatePassword(to: newPassword, completion: { (error) in
                   if error != nil {
                     // Handle password update error
                       print("Error updating email: \(error?.localizedDescription)")
                     return
                  }
                  // Password update successful
                   print("Password update successful")
               })
            })
    }
}
