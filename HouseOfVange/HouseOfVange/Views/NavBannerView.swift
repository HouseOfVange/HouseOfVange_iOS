//
//  nav_banner.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/14/22.
//

import Foundation
import SwiftUI

struct NavBannerView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var users = UserViewModel()
    
    var body: some View{
        
        Text("")
            .navigationBarHidden(true)
        
        HStack {
//            Spacer()
            
            NavigationLink(destination: UserProfileView()){
                VStack{
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                    Text("stats")
                        .foregroundColor(.white)
                        .background(.red)
                }
                .foregroundColor(.white)
                .background(.red)
                .padding(5)
                .border(.white)
            }
//            .padding(.bottom, 10)
//            .padding(.top, 10)
            .padding(5)
//            .border(.white)
                
            
            Spacer()
            
            NavigationLink(destination: FAQsView()){
                VStack{
                    Image(systemName: "person.fill.questionmark")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                    Text("FAQs")
                }
                .foregroundColor(.white)
                .background(.red)
                .foregroundColor(.white)
                .background(.red)
                .padding(5)
                .border(.white)
            }
            .padding(5)
            
            Spacer()
            NavigationLink(destination: PortfolioView()){
                VStack{
                    Image(systemName: "house")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                    Text("home")
                }
                .foregroundColor(.white)
                .background(.red)
                .padding(5)
                .border(.white)
            }
            .padding(5)
            
            Spacer()
            
            NavigationLink(destination: GuestBookView()){
                VStack{
                    Image(systemName: "book")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                    Text("g-book")
                }
                .foregroundColor(.white)
                .background(.red)
                .padding(5)
                .border(.white)
            }
            .padding(5)
            
            Spacer()
            
            Button(action: {
                
                viewModel.signOut()
            }, label: {
                VStack{
                    Image(systemName: "peacesign")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                    Text("bye")
//                        .foregroundColor(.white)
//                        .background(.red)
                }
                .foregroundColor(.white)
                .background(.red)
                .padding(5)
                .border(.white)
            })
//                .cornerRadius(8)
                .foregroundColor(.white)
                .background(.red)
                .padding(5)
//                .border(.white)
            
//        Spacer()
            
        }
        .frame(alignment: .topLeading)
        .foregroundColor(.white)
        .background(.red)
//        .padding(5)
    }
}
