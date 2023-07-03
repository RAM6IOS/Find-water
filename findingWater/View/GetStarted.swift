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
        VStack {
       Image("map")
                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                  .padding(.top, 44)
            VStack {
                Text("Welcome")
                    .font(.system(size: 40))
                    .bold()
                Text("finding Water")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
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
        }
    }
}
