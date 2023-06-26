//
//  About.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 26/6/2023.
//

import SwiftUI

struct About: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    Image("drop2")
                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                        .padding(.top, 44)
                                Text("Finding Water")
                                    .fontWeight(Font.Weight.heavy)
                                    .font(.system(size: 30))
            Text("""
                         It is an application created to help people who suffer from a shortage of water supplies to find free water filling points for their daily drinking and use.
                         
                         Where you can know the water filling points near you and determine the path to them and know if there were people at the fill point.
            """)
            .bold()
                    .padding()
                        Spacer()
                }.navigationTitle("About")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
