//
//  LoginView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/2/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @State private var hov_username = ""
    @State private var hov_password = ""
    
    var body: some View {
    
        VStack{
            Text("LOGIN").font(.largeTitle).bold().foregroundColor(.red)
            NavigationLink(destination: CreateAccountView()){
                Text("create account")
            }
            Form{
                TextField("Username", text: $hov_username)
                TextField("Password", text: $hov_password)
                }
            }
        .pickerStyle(.segmented)
        }
    }
