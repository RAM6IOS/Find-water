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
           
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
