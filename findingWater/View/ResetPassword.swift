//
//  ResetPassword.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/7/2023.
//

import SwiftUI
import Firebase
import UIKit
import FirebaseAuth

struct ResetPassword: View {
    @ObservedObject var resetPasswordVM = ResetPasswordViewModel()
        var body: some View {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    if resetPasswordVM.checkMail {
                        CheckMail()
                    } else {
                        VStack {
                Text("""
                             Enter the email associated with your account and we'll send an email With instructions to reset your password
                             """)
                            TextFieldComponat2(name: $resetPasswordVM.email, title: "Email")
                            Button {
                                resetPasswordVM.resetPassword(email: resetPasswordVM.email)
                                print("Password reset email sent successfully!")
                            }label: {
                                ButtonComponat(text: "Reset Password")
                            }
                            Spacer()
                        }
                        .padding()
                        .navigationTitle("Reset Password")
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
