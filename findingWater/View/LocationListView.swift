//
//  LocationListView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct LocationListView: View {
    @State private var locations: [Location] = [Location(record: MockData.location)]
    var body: some View {
        NavigationView{
            List{
                ForEach(locations ,id:\.ckRecordID){ location in
                    NavigationLink{
                        LocationList_Details(location: location)
                    }label: {
                        LocationCell(location: location)
                        
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
