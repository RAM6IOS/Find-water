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
    @State var showPasword: Bool = false
    @State var showNewPassword: Bool = false
    var body: some View {
        VStack {
            if showPasword {
                HStack(alignment: .center) {
                    TextField("Password", text: $updatePasswordVM.currentPassword)
                    Image(systemName: "eye")
                        .onTapGesture {
                            withAnimation {
                                self.showPasword.toggle()
                            }
                        }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
                .padding(.vertical)
            } else {
                HStack(alignment: .center) {
                    SecureField("Password", text: $updatePasswordVM.currentPassword)
                    Image(systemName: "eye.slash")
                        .onTapGesture {
                            withAnimation {
                                self.showPasword.toggle()
                            }
                        }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                .padding(.vertical)
            }
            
            if showNewPassword {
                HStack(alignment: .center) {
                    TextField("New Password", text: $updatePasswordVM.newPassword)
                    Image(systemName: "eye")
                        .onTapGesture {
                            withAnimation {
                                self.showNewPassword.toggle()
                            }
                        }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
                .padding(.vertical)
            } else {
                HStack(alignment: .center) {
                    SecureField("New Password", text: $updatePasswordVM.newPassword)
                    Image(systemName: "eye.slash")
                        .onTapGesture {
                            withAnimation {
                                self.showNewPassword.toggle()
                            }
                        }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                .padding(.vertical)
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
