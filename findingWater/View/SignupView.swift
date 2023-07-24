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
                    SignupViewComponat(title: "drop", title2: "Sign up", fram: 80)
                    VStack {
                        TextFieldComponat2(name: $viewModel.name, title: "Name")
                        TextFieldComponat2(name: $viewModel.email, title: "Email Address")
                    if showpasword {
                        TextFieldComponat(name: $viewModel.password, show: $showpasword, title: "Password")
                    } else {
                        SecureFieldComponat(name: $viewModel.password, show: $showpasword, title: "Password")
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
                    LoginViewComponat(showLign: $showLgn)
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
