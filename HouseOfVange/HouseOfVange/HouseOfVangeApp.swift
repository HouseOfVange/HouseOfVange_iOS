//
//  HouseOfVangeApp.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/26/22.
//

import SwiftUI
import Firebase

@main
struct HouseOfVangeApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    init() {
//        FirebaseApp.configure()
//    }
//

    var body: some Scene {
        WindowGroup {
            
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}

