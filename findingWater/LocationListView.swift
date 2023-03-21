//
//  LocationListView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct LocationListView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(0..<10){_ in
                    NavigationLink{
                        LocationList_Details()
                    }label: {
                        HStack{
                            Image("water")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80 , height: 80)
                                .clipShape(Circle())
                                .padding(.vertical, 8)
                            VStack(alignment: .leading){
                                Text("Test Location Name")
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
            }
            .listStyle(.plain)
            .navigationTitle("LocationList")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
