//
//  LocationCell.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 23/3/2023.
//

import SwiftUI
struct LocationCell: View {
    var location: Location
    var body: some View {
        HStack{
            Image("water")
                .resizable()
                .scaledToFit()
                .frame(width: 80 , height: 80)
                .clipShape(Circle())
                .padding(.vertical, 8)
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                HStack{
                    Image("default-avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35 , height: 35)
                    .clipShape(Circle())
                }
            }
            .padding(.leading)
        }
    }
}

