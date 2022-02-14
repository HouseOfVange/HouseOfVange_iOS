//
//  UserProfileView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/10/22.
//

import SwiftUI
import Foundation

struct UserProfileView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var users = UserViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack{
                Button {
                    print("back to home page!")
                    viewModel.goToProfileView()
                } label: {
                    Text("Home")
                }
                
                Spacer()
            }
            
            Text("Profile Stats")
                .bold()
                .onAppear {
                    print(users.sum)
                    print(users.currentUsername)
                }
            
            Text("\(users.currentUsername)")
//                .onAppear {
//                    print(users.sumPurchases(email: viewModel.currentUserEmail))
//                }
            Text("You joined on DATE HERE and have purchased NUMBER OF  pieces for SUM OF \(users.sum) PRICE POINTS HERE")
            
            ForEach(users.users) { item in
                if item.email == viewModel.currentUserEmail {
                    Text("\(item.username)!")
                        .bold()
                }
            }
            
            Spacer()
        }
    }
}
