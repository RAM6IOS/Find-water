//
//  GetStartedScreniPad.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 7/7/2023.
//

import SwiftUI

struct GetStartedScreniPad: View {
    @Binding var show: Bool
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.system(size: 60))
            if #available(iOS 16.0, *) {
                Text("finding Water")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            } else {
                // Fallback on earlier versions
            }
            HStack(alignment: .center,spacing: 40) {
                Image("route")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                VStack {
                    Text("Resource water Locations").bold()
                    Text("Find places to resource water")
                        .foregroundColor(.white)
                }
                .font(.system(size: 40))
                .minimumScaleFactor(0.5)
            }
            Spacer()
            Button {
                show.toggle()
            }label: {
                Text("Get Started")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
