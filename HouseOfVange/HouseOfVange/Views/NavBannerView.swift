//
//  nav_banner.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/14/22.
//

import Foundation
import SwiftUI

struct nav_banner: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var users = UserViewModel()
    
    var body: some View{
        
        HStack {
            Text("")
                .navigationBarHidden(true)
        
            NavigationLink(destination: UserProfileView(users: users)){
                Text("ur stats")
                    .foregroundColor(.white)
                    .background(.red)
            }
            
            Spacer()
            
            NavigationLink(destination: GuestBookView()){
                Text("guestbook")
                    .foregroundColor(.white)
                    .background(.red)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.signOut()
            }, label: {
                Text("leave house")
                    .foregroundColor(.white)
                    .background(.red)
                    .padding()
            })
                .cornerRadius(8)
        }
        .frame(alignment: .topLeading)
    }
}
