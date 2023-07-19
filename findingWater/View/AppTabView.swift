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
    @EnvironmentObject var viewModel: CreateAccount
    var body: some View {
        VStack {
            if viewModel.showOnbord == false {
                GetStarted(show: $viewModel.showOnbord)
            } else {
                if viewModel.userSession == nil {
                    SignupView()
                } else {
                    LocationMapView()
                }
            }
        }
        }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
