//
//  ShopViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/31/22.
//

import Foundation
import SwiftUI

struct ShopViewModel: View {
    @State var username: String = ""
        
        var body: some View {
            NavigationView {
                Form {
                    TextField("Username", text: $username)
                }
                .navigationBarTitle("Settings")
            }
        }
}
