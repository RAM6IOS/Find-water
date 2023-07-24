//
//  SignupViewComponat.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/7/2023.
//

import SwiftUI

struct SignupViewComponat: View {
    var title: String
    var title2: String
    var fram: CGFloat
    var body: some View {
        Spacer()
        Image(title)
            .resizable()
            .scaledToFill()
            .frame(width: fram, height: fram) // Replace with your Airbnb logo
        Text( title2)
            .font(.title)
            .fontWeight(.bold)
            .padding()
    }
}

struct SignupViewComponat2: View {
    @Binding  var showForgotPassword: Bool
    @Binding var showLign: Bool
    var body: some View {
        VStack {
            Button(action: {
                // Perform actions for forgot password
                showForgotPassword.toggle()
            }) {
                Text("Forgot password?")
                    .foregroundColor(.blue)
                    .padding(.bottom)
            }
            Text("Don't have an account?")
                .foregroundColor(.gray)
            Button(action: {
                // Perform actions for sign up
                showLign.toggle()
            }) {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
            }
            .padding(.horizontal, 32)
            Spacer()
        }
        .sheet(isPresented: $showForgotPassword) {
            ResetPassword()
        }
    }
}


