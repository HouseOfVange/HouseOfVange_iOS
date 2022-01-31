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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

