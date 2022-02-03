//
//  CreateAccountView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/2/22.
//

import Foundation
import SwiftUI

struct CreateAccountView: View {
    
    @State private var hov_username = ""
    @State private var hov_password = ""
    @State private var hov_user_email = ""
    
    var body: some View {
    
        VStack{
            Text("You've come to the right house.").font(.largeTitle).bold().foregroundColor(.red)
            Text("Create your HOV account:")
            Form{
                TextField("Username", text: $hov_username)
                TextField("Password", text: $hov_password)
                TextField("email", text: $hov_user_email)
                }
            }
        }
    }
