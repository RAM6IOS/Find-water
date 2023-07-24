//
//   ButtonComponat.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 24/7/2023.
//

import SwiftUI

struct ButtonComponat: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
    }
}


