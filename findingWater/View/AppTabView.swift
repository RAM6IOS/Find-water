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
    @State var showOnbord: Bool = false
    @EnvironmentObject var viewModel: CreateAccount
    var body: some View {
        if viewModel.userSession == nil {
            SignupView()
        } else {
            LocationMapView()
           
        }
        }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
