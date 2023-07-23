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
     @ObservedObject var updatePasswordVM = UpdatePasswordViewModel()
    var body: some View {
        VStack {
            if updatePasswordVM.showPassword  {
            TextFieldComponat(name: $updatePasswordVM.currentPassword, show: $updatePasswordVM.showPassword 
                              , title: "Password")
            } else {
                SecureFieldComponat(name: $updatePasswordVM.currentPassword, show: $updatePasswordVM.showPassword 
                                    , title: "Password")
            }
            if updatePasswordVM.showNewPassword {
                TextFieldComponat(name: $updatePasswordVM.newPassword, show: $updatePasswordVM.showNewPassword
                                  , title: "New Password")
            } else {
                SecureFieldComponat(name: $updatePasswordVM.newPassword, show: $updatePasswordVM.showNewPassword
                                    ,title: "New Password")
            }
            Spacer()
                    Button(action: {
                        updatePasswordVM.updatePassword(newPassword: updatePasswordVM.newPassword, currentPassword: updatePasswordVM.currentPassword)
                        updatePasswordVM.currentPassword = ""
                        updatePasswordVM.newPassword = ""
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
