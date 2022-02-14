//
//  CreateAccountView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/2/22.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var pieces = PieceViewModel()
    @ObservedObject var users = UserViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                VStack{
                    
                    Text("The time to create an account is now!").font(.largeTitle).bold().foregroundColor(.red)
                        .padding()
                    
                    //                Form{
                    TextField("email", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    TextField("username", text: $username)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        guard !email.isEmpty,!password.isEmpty else{
                            return
                        }
                        
                        viewModel.signUp(email: email, password: password, username: username)
//                        users.addUser(username: username, email: email)
                        
                    }, label: {
                        Text("Create account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    )
                    
                }
                .padding()
                
                Spacer()
                
            }
        }
        //        .navigationTitle("The time to login is now!")
    }
}
