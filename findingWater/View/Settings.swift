//
//  Settings.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 23/6/2023.
//

import SwiftUI

struct Settings: View {
    @Binding var isPresenting: Bool
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    List {
                        NavigationLink {
                            Text("jdsjnmqds")
                        } label: {
                            HStack {
                                Image(systemName: "book")
                                Text("about")
                            }
                        }
                        NavigationLink {
                            Text("jdsjnmqds")
                        } label: {
                            HStack {
                                Image(systemName: "person")
                                Text("Change Profile")
                            }
                        }
                        NavigationLink {
                            Text("jdsjnmqds")
                        } label: {
                            HStack {
                                    Image(systemName: "envelope")
                                    Text("Change Email")
                                    }
                        }
                        NavigationLink {
                            Text("jdsjnmqds")
                        } label: {
                            HStack {
                                Image(systemName: "lock")
                                Text("Change Password")
                                }
                        }
                        HStack {
                                        Image(systemName: "i.circle")
                                        Link("Privacy Policy", destination: URL(string: "https://akdili.vercel.app/")!)
                                                    .foregroundColor(.black)
                                            }
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                               Button {
                                                  // viewModel.logout()
                                               } label: {
                                                   HStack {
                                                       Text("Logout")
                                                           .foregroundColor(.black)
                                                   }
                                               }
                                           }
                        HStack {
                            Image(systemName: "trash")
                                Button {
                                                   // viewModel.delete()
                                  } label: {
                                    HStack {
                                            Text("Delete")
                                                .foregroundColor(.black)
                                                    }
                                                }
                                            }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isPresenting.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Back")
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(isPresenting: .constant(true))
    }
}
