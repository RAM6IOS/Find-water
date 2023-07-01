//
//  SignupView.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/6/2023.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var name: String = ""
    @EnvironmentObject var viewModel: CreateAccount
    @State var showLgn :Bool = false
    var body: some View {
        VStack {
            if showLgn == false {
                LoginView( showLgn: $showLgn)
            } else {
                VStack {
                    Image("drop")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80) // Replace with your Airbnb logo
                    Text("Sign up ")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.vertical)
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.vertical)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.vertical)
                    Button(action: {
                        // Perform signup logic here
                        withAnimation {
                            viewModel.register(withEmail: email,
                                               password: password,
                                               name: name
                            )
                            email = ""
                            name = ""
                            password = ""
                            viewModel.fetchUser()
                        }
                    }) {
                        Text("Sign up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    Text("I already have an account")
                        .foregroundColor(.gray)
                    Button( action: {
                        // Perform actions for sign up
                        showLgn.toggle()
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
                .padding()
            }
        }
    }
    private func isValidSignup() -> Bool {
        // Add your own signup validation logic here
        // For example, check if the email is valid and if the passwords match certain criteria
        // Return true if the signup is valid, false otherwise
        return isValidEmail() && arePasswordsValid()
    }
    private func isValidEmail() -> Bool {
        // Implement your email validation logic here
        // Return true if the email is valid, false otherwise
        return !email.isEmpty && email.contains("@")
    }
    private func arePasswordsValid() -> Bool {
        // Implement your password validation logic here
        // Return true if the passwords match and meet certain criteria, false otherwise
        return !password.isEmpty && password == confirmPassword
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
