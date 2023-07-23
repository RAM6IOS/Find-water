//
//  TextFieldComponat.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 23/7/2023.
//

import SwiftUI

struct TextFieldComponat: View {
    @Binding var name: String
    @Binding var show: Bool
    var title: String
    var body: some View {
        HStack(alignment: .center) {
            TextField(title , text: $name )
            Image(systemName: "eye")
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.4), radius: 4, x: 1, y: 2)
        .padding(.vertical)
    }
}

struct SecureFieldComponat: View {
    @Binding var name: String
    @Binding var show: Bool
    var title: String
    var body: some View {
        HStack(alignment: .center) {
            SecureField(title, text: $name)
            Image(systemName: "eye.slash")
                .onTapGesture {
                    withAnimation {
                        self.show.toggle()
                    }
                }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.vertical)
    }
}

struct TextFieldComponat2: View {
    @Binding var name: String
    var title: String
    var body: some View {
        TextField(title, text: $name)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.vertical)
    }
}
