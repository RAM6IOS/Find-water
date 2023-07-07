//
//  GetStarted.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 11/4/2023.
//

import SwiftUI

struct GetStarted: View {
    @Binding var show: Bool
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                Image("maps-and-flags")
                    .resizable()
                    .scaledToFit()
                    .frame(width: reader.size.width * (1.5/5), height: reader.size.height * (1.5/5))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding(.top, 44)
                VStack {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        GetStartedScreniPad(show: $show, width: reader.size.width * (1/5), height: reader.size.height * (1/5))
                    } else {
                        Text("Welcome")
                            .font(.title)
                            .minimumScaleFactor(0.5)
                        if #available(iOS 16.0, *) {
                            Text("finding Water")
                                .font(.title2)
                                .minimumScaleFactor(0.5)
                                .fontWeight(.bold)
                        } else {
                            // Fallback on earlier versions
                        }
                        HStack(alignment: .center) {
                            Image("location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width * (1/5), height:  reader.size.height * (1/5))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            VStack {
                                Text("Resource water Locations").bold()
                                Text("Find places to resource water")
                                    .foregroundColor(.secondary)
                            }
                            .font(.title3)
                            .minimumScaleFactor(0.5)
                        }
                        Spacer()
                        Button {
                            show.toggle()
                        }label: {
                            Text("Get Started")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
                .padding()
            } }
        .background(.blue)
    }
}
