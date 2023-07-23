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
    @ObservedObject var createAccountVM = CreateAccount()
    @ObservedObject var updateEmailVM = UpdateEmailViewModel()
    var body: some View {
VStack {
    TextFieldComponat2(name: $updateEmailVM.email, title: "New Email")
    if updateEmailVM.showPassword {
    TextFieldComponat(name: $updateEmailVM.password,show: $updateEmailVM.showPassword
                      , title: "Password")
    } else {
        SecureFieldComponat(name: $updateEmailVM.password, show: $updateEmailVM.showPassword
                            , title: "Password")
    }
    Spacer()
            Button {
                updateEmailVM.updateEmail(newEmail: updateEmailVM.email, password: updateEmailVM.password, id: createAccountVM.currentUser?.id  ?? "reewwedsewd", email: updateEmailVM.email)
                updateEmailVM.email = ""
                updateEmailVM.password = " "
            }label: {
                Text("Update Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

                    }
.navigationTitle("Update Email")
.padding()
    }
}

struct UpdateEmail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmail()
    }
}
