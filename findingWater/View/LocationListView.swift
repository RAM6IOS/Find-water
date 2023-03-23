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
                        LocationCell()
                        
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
