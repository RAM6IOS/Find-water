//
//  ProfileView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var  LocationMapVM = LocationMapViewModel()
    
    var body: some View {
        NavigationView {
            List(LocationMapVM.source) { user in
                Text(user.name)
                Text("\(user.location.latitude)")
                Text("\(user.location.longitude)")
                    }
              .navigationBarTitle("Books")
              .onAppear() { // (3)
                  self.LocationMapVM.fetchDataWaterSource()
              }
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
