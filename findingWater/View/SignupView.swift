//
//  SignupView.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/6/2023.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var viewModel: CreateAccount
    @State var showLgn: Bool = false
    @State var showpasword = false
    var body: some View {
        VStack {
            if showLgn == true {
                LoginView( showLgn: $showLgn)
            } else {
                VStack {
                    Spacer()
                    Image("drop")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80) // Replace with your Airbnb logo
                    Text("Sign up ")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    VStack {
                        TextField("Name", text: $viewModel.name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.vertical)
                        TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.vertical)
                    if showpasword {
                        HStack(alignment: .center) {
                            TextField("Password", text: $viewModel.password)
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
                            SecureField("Password", text: $viewModel.password)
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
                        // Perform signup logic here
                        withAnimation {
                            viewModel.register(withEmail: viewModel.email,
                                               password: viewModel.password,
                                               name: viewModel.name
                            )
                            viewModel.email = ""
                            viewModel.name = ""
                            viewModel.password = ""
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
                }
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
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
