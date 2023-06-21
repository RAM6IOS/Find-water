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
        VStack{
            Spacer()
            Text("finding Water")
                .font(.title2)
                .fontWeight(.bold)
            VStack(alignment: .leading, spacing: 32){
                HStack(spacing: 26) {
                    Image(systemName: "building.2.crop.circle" )
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Resource water Locations").bold()
                        Text("Find places to resource water")
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                            .minimumScaleFactor(0.75)
                    }
                }
                HStack(spacing: 26) {
                    Image("tank-truck")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Water Truck").bold()
                        Text("Find places to Water Truck in State")
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                            .minimumScaleFactor(0.75)
                    }
                }
            }
            Spacer()
            Button{
                show.toggle()
            }label: {
                Text("GetStarted")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 340 ,height: 40)
            .background(.blue)
            .cornerRadius(15)
        }
    }
}
