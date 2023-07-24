//
//  LoginViewComponat.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/7/2023.
//

import SwiftUI

struct LoginViewComponat: View {
    @Binding var  showLign: Bool
    var body: some View {
        Text("I already have an account")
            .foregroundColor(.gray)
        Button( action: {
            // Perform actions for sign up
            showLign.toggle()
        }) {
            Text("Log in")
                .font(.headline)
                .foregroundColor(.blue)
                .padding()
        }
        .padding(.horizontal, 32)
        Text("By signing up, you agree to our Terms of Service and Privacy Policy.")
            .font(.footnote)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding()
        Spacer()
    }
}


