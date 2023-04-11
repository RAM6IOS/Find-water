//
//  AppTabView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct AppTabView: View {
    init() {
            UITabBar.appearance().barTintColor = UIColor.blue
        }
    @State var ShowOnboarding = true
    //@AppStorage("ShowOnboarding")

    var body: some View {
        if ShowOnboarding{
            GetStarted(ShowOnboarding: $ShowOnboarding)
            
        } else{
            TabView {
                LocationMapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                
                LocationListView()
                    .tabItem {
                        Label("Locations", systemImage: "building")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .accentColor(.black)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
