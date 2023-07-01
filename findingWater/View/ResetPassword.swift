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
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
                   .padding(.vertical)
                
                Button{
                    resetPasswordVM.resetPassword(email: email)
                    print("Password reset email sent successfully!")
                }label: {
                Text("ResetPassword")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
            
            
        }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
