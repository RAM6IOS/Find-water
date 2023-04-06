//
//  LocationList Details.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 21/3/2023.

import SwiftUI
struct LocationList_Details: View {
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            
        ]
    var location: Location
    var body: some View {
        VStack{
            
        }
        
    }
}

struct ExtractedView: View {
    var body: some View {
        VStack{
            Image("default-avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 65 , height: 65)
                .clipShape(Circle())
                .padding()
            Text("name")
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}

struct LocationActionButton: View {
    
    var color: Color
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 60, height: 60)
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
            
        }
    }
}
