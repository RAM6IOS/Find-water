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
    @StateObject var viewModel = CreateAccount()
    @State var showForgotPassword: Bool = false
    @Binding var showLgn: Bool
    @State var showpasword = false
    var body: some View {
        ZStack {
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
                if showpasword {
                    HStack(alignment: .center) {
            TextField("Password", text: $password)
                        Image(systemName: "eye")
                                        .onTapGesture {
                                            withAnimation {
                                                    self.showpasword.toggle()
                                                           }
                                                       }
                                               }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .padding(.vertical)
                } else {
                    HStack(alignment: .center) {
                        SecureField("Password", text: $password)
                        Image(systemName: "eye.slash")
                            .onTapGesture {
                                withAnimation {
                                    self.showpasword.toggle()
                                }
                            }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .padding(.vertical)
                }
                Button(action: {
                    withAnimation {
                                            viewModel.login(withEmail: email, password: password)
                        
                                        }
                    email = ""
                    password = ""
                    viewModel.fetchUser()
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
                    showLgn.toggle()
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
            .onAppear {
               // self.viewModel.fetchUser()
            }
            .padding()
        }
    }
    private func isValidLogin() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
}

