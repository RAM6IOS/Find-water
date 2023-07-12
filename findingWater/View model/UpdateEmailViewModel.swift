//
//  UpdateEmailViewModel.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 2/7/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine
class  UpdateEmailViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
        
        func updateEmail(newEmail: String, password: String, id: String, email: String) {
            guard let user = Auth.auth().currentUser else {
                print("No authenticated user")
                return
            }
            
            // Prompt the user to reauthenticate
            let credential = EmailAuthProvider.credential(withEmail: user.email ?? "", password: password)
            
            user.reauthenticate(with: credential)
                .flatMap { _ in
                    user.updateEmail(to: newEmail)
                        .eraseToAnyPublisher()
                }
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        // Handle the update email error
                        print("Error updating email: \(error.localizedDescription)")
                    case .finished:
                        // Email updated successfully
                        print("Email updated successfully")
                        self.editProducti(id: id, email: email)
                    }
                } receiveValue: { _ in }
                .store(in: &self.cancellables)
        }

        
        
        
    
   

    /*
    func updateEmail(newEmail: String, password: String, id: String, email: String) {
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
     */
    func editProducti(id: String, email: String) {
        Firestore.firestore().collection("users").document(id)
            .updateData(["email": email
                        ]) { _ in
            }
    }
}
