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
            VStack(spacing: 16) {
                Image("pizza")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                HStack {
                    Label(location.address, systemImage: "mappin.and.ellipse")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .padding(.horizontal)
                ZStack {
                    Capsule()
                        .frame(height: 80)
                        .foregroundColor(Color(.secondarySystemBackground))
                    
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .newPrimaryColor, imageName: "location.fill")
                        }
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .green, imageName: "person.fill.checkmark")
                        }
                    }
                }
                Text("Who s Here?")
                    .bold()
                    .font(.title2)
                ScrollView {
                    LazyVGrid(columns: columns, content: {
                        ExtractedView()
                        ExtractedView()
                        ExtractedView()
                        ExtractedView()
                        ExtractedView()
                        ExtractedView()
                        ExtractedView()
                    })
                    Spacer()
                }
            }
            .navigationTitle(location.name)
            .navigationBarTitleDisplayMode(.inline)
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
