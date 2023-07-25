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
            TextFieldComponat2(name: $name, title: "Name")
            Button {
                updateName(name: name)
            }label: {
                ButtonComponat(text: "Update Name")
            }
            .padding()
            Spacer()
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
