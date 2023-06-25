//
//  UpdateEmail.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/6/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct UpdateEmail: View {
    @State var email = ""
    @State var password = ""
    @State private var error: Error?
    @ObservedObject var createAccountVM = CreateAccount()
    var body: some View {
        Form {
                        TextField("New Email", text: $email)
                TextField("Password", text: $password)
            Button {
                updateEmail(newEmail: email, password: password)
            }label: {
                Text("Update")
            }

                    }
    }
    func updateEmail(newEmail: String, password: String ) {
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
                        editProducti()
                    }
                }
            }
        }
    }

    func editProducti() {
        Firestore.firestore().collection("users").document(createAccountVM.currentUser?.id  ?? "reewwedsewd")
            .updateData(["email": email
                        ]) { _ in
            }
    }
       
}

struct UpdateEmail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmail()
    }
}
