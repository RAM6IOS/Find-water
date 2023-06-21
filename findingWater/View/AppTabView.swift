//
//  AppTabView.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 19/3/2023.
//

import SwiftUI

struct AppTabView: View {
    init() {
          //  UITabBar.appearance().barTintColor = UIColor.blue
        }
    @State var showOnbord : Bool = false
    @EnvironmentObject var viewModel : CreateAccount
    var body: some View {
            TabView {
                SignupView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                LocationMapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
            }
            .accentColor(.black)
        /*
        if ShowOnboarding{
            GetStarted(ShowOnboarding: $ShowOnboarding)
            
        } else{
            TabView {
                LocationMapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                
                MapTest()
                    .tabItem {
                        Label("Locations", systemImage: "building")
                    }
                
                SignupView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .accentColor(.black)
         */
        }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
