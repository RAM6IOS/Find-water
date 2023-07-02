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
    @State var email = ""
    @State var password = ""
    @State private var error: Error?
    @ObservedObject var createAccountVM = CreateAccount()
    @ObservedObject var updateEmailVM = UpdateEmailViewModel()
    var body: some View {
VStack {
        TextField("New Email", text: $email)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
            .padding(.vertical)
        TextField("Password", text: $password)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
            .padding(.vertical)
    Spacer()
            Button {
                updateEmailVM.updateEmail(newEmail: email, password: password, id: createAccountVM.currentUser?.id  ?? "reewwedsewd", email: email)
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
