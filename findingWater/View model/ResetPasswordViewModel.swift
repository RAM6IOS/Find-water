//
//  ResetPasswordViewModel.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/7/2023.
//

import Foundation
import Firebase
import UIKit
import FirebaseAuth

class ResetPasswordViewModel: ObservableObject {
    @Published var checkMail: Bool = false
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email ) { error in
            if let error = error {
                print("Error sending password reset email: \(error.localizedDescription)")
                self.checkMail.toggle()
            } else {
                self.checkMail.toggle()
                print("Password reset email sent successfully!")
            }
        }
    }
}
