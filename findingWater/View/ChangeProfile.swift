//
//  ChangeProfile.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 27/6/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ChangeProfile: View {
    @State var name = ""
    @ObservedObject var createAccountVM = CreateAccount()
    var body: some View {
        VStack {
            TextField("New Email", text: $name)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
               .padding(.vertical)
            Button {
                updateName(name: name)
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
        .navigationTitle("Update Name")
        .padding()
    }
    func  updateName(name: String) {
        Firestore.firestore().collection("users").document(createAccountVM.currentUser?.id  ?? "reewwedsewd")
            .updateData(["name": name
                        ]) { _ in
            }
    }
}

struct ChangeProfile_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProfile()
    }
}
