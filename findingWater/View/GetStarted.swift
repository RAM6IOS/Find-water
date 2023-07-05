//
//  GetStarted.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 11/4/2023.
//

import SwiftUI

struct GetStarted: View {
    @Binding var show: Bool
    var body: some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                Image("map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: reader.size.width * (2/5), height: reader.size.height * (2/5))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding(.top, 44)
                VStack {
                    Text("Welcome")
                        .font(.system(size: 40))
                        .bold()
                    if #available(iOS 16.0, *) {
                        Text("finding Water")
                            .font(.system(size: 24))
                            .minimumScaleFactor(0.5)
                            .fontWeight(.bold)
                    } else {
                        // Fallback on earlier versions
                    }
                    HStack(alignment: .center) {
                        Image("location")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        VStack {
                            Text("Resource water Locations").bold()
                            Text("Find places to resource water")
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                                .minimumScaleFactor(0.75)
                        }
                    }
                }
                .padding()
                Spacer()
                Button {
                    show.toggle()
                }label: {
                    Text("GetStarted")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            } }
    }
}
