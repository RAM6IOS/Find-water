//
//  LoginView.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/6/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
        
            VStack {
                Spacer()
                Image("drop")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                Text("Welcome back")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
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
                    // Perform login logic here
                    // You can access the entered email and password using the `email` and `password` variables
                    
                    // Example login logic
                    if email == "user@example.com" && password == "password" {
                        // Successful login, navigate to the next screen or perform further actions
                        print("Login successful")
                    } else {
                        // Failed login, show an error message or perform other actions
                        print("Login failed")
                    }
                }) {
                    Text("Log in")
                        .foregroundColor(.white)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                Button(action: {
                    // Perform actions for forgot password
                    print("Forgot password tapped")
                }) {
                    Text("Forgot password?")
                        .foregroundColor(.blue)
                        .padding(.bottom)
                }
                
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Perform actions for sign up
                    print("Sign up tapped")
                }) {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                }
                .padding(.horizontal, 32)
                
                Spacer()
            }
            .padding()
        }
    }
    
    private func isValidLogin() -> Bool {
        // Add your own login validation logic here
        // For example, check if the email and password meet certain criteria
        // Return true if the login is valid, false otherwise
        return !email.isEmpty && !password.isEmpty
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}





