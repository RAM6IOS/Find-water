//
//  findingWaterApp.swift
//  findingWater
//
//  Created by Bouchedoub Ramzi on 12/2/2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FindingWaterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = CreateAccount()
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(viewModel)
                .navigationBarHidden(true)
        }
    }
}
