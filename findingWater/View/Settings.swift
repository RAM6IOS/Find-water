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
                    Text("A full-screen modal view.")
                        .font(.title)
                    Text("Tap to Dismiss")
                }
                .onTapGesture {
                    isPresenting.toggle()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .ignoresSafeArea(edges: .all)
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
