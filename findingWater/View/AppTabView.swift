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

    var body: some View {
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
        .onAppear {
                if #available(iOS 15.0, *) {
                        let appearance = UITabBarAppearance()
                    UITabBar.appearance().backgroundColor = UIColor(named:"Color1")
                            UITabBar.appearance().scrollEdgeAppearance = appearance
                              
                    
                                       }
                    }
        
        .accentColor(.black)
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
