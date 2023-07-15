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
    /*
    func updateEmail(newEmail: String, password: String, id: String, email: String) {
        let user = Auth.auth().currentUser
        let credential = EmailAuthProvider.credential(withEmail: user?.email ?? "", password: password)
        
        user?.reauthenticate(with: credential)
            .flatMap { _ in
                user?.updateEmail(to: newEmail).publisher
                    .mapError { $0 as Error }
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    // Handle the update email error
                    print("Error updating email: \(error.localizedDescription)")
                case .finished:
                    // Email updated successfully
                    print("Email updated successfully")
                    self.editProducti(id: id, email: email)
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
    */

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
    func updateEmail(newEmail: String, password: String, id: String, email: String) {
        guard let user = Auth.auth().currentUser else {
            return
        }
        let credential = EmailAuthProvider.credential(withEmail: user.email ?? "", password: password)
        let reauthPublisher = Future<Void, Error> { promise in
            user.reauthenticate(with: credential) { _, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(()))
                }
            }
        }
        let updateEmailPublisher = reauthPublisher
            .flatMap { _ in
                Future<Void, Error> { promise in
                    user.updateEmail(to: newEmail) { error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
            }
        updateEmailPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error updating email: \(error.localizedDescription)")
                case .finished:
                    print("Email updated successfully")
                    self.editProducti(id: id, email: email)
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }

    func editProducti(id: String, email: String) {
        Firestore.firestore().collection("users").document(id)
            .updateData(["email": email
                        ]) { _ in
            }
    }
}

