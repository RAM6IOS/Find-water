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
    @State private var email = ""
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
                            TextField("Email", text: $email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
                                .padding(.vertical)
                            Button {
                                resetPasswordVM.resetPassword(email: email)
                                print("Password reset email sent successfully!")
                            }label: {
                                Text("Reset Password")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
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
