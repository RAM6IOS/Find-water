//
//  LoginView.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 1/6/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: CreateAccount
    @State var showForgotPassword: Bool = false
    @Binding var showLgn: Bool
    @State var showpasword = false
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                SignupViewComponat(title: "drop", title2: "Welcome back", fram: 100)
                TextFieldComponat2(name: $viewModel.email, title: "Email Address")
                if showpasword {
                    TextFieldComponat(name: $viewModel.password, show: $showpasword, title: "Password")
                } else {
                    SecureFieldComponat(name: $viewModel.password, show: $showpasword, title: "Password")
                }
                Button(action: {
                    withAnimation {
                        viewModel.login(withEmail: viewModel.email, password: viewModel.password)
                                        }
                    viewModel.email = ""
                    viewModel.password = ""
                    viewModel.fetchUser()
                }) {
                    ButtonComponat(text: "Log in")
                }
                .padding(.vertical)
                SignupViewComponat2(showForgotPassword: $showForgotPassword, showLign: $showLgn)
            }
            .padding()
        }
    }
}
