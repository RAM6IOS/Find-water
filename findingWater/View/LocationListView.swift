//
//  LocationListView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct LocationListView: View {
   // @State private var locations: [Location] = [Location(record: MockData.location)]
    @ObservedObject var  LocationListVM = LocationListViewModel()

    var body: some View {
        NavigationView{
            List(LocationListVM.location) { user in
                Text(user.name)
                Text(user.Phone)
                
            }
            .onAppear{
                self.LocationListVM.fetchData()
            }
           
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
