//
//  CheckMail.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 2/7/2023.
//

import SwiftUI

struct CheckMail: View {
    var body: some View {
        VStack {
            Image(systemName: "envelope.fill")
                .font(.system(size: 80))
                .padding()
            Text("Check your mail")
                .font(.system(size: 40))
                .font(.title3)
                .bold()
               
            Text("""
                 We have sent a Password recover
                 instructions to your email
                 """)
            .padding()
            Spacer()
        }
    }
}

struct CheckMail_Previews: PreviewProvider {
    static var previews: some View {
        CheckMail()
    }
}
