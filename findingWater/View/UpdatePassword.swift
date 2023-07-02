//
//  UpdatePassword.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 25/6/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct UpdatePassword: View {
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var error: Error?
    @ObservedObject var updatePasswordVM = UpdatePasswordViewModel()
    var body: some View {
        VStack {
            SecureField("Current Password", text: $currentPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
                .padding(.vertical)
            SecureField("New Password", text: $newPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
                .padding(.vertical)
            Spacer()
                    Button(action: {
                        updatePasswordVM.updatePassword(newPassword: newPassword, currentPassword: currentPassword)
                    }) {
                        Text("Update Password")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
        .navigationTitle("Update Password")
        .padding()
    }
}

struct UpdatePassword_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePassword()
    }
}
