//
//  StatusWindowView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/12/22.
//

import Foundation
import SwiftUI

struct StatusWindowView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var users = UserViewModel()
    @ObservedObject var pieces = PieceViewModel()
    @ObservedObject var prices = PriceViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    var status_price: Int
    
    var body: some View{
            VStack {
//                ForEach(users.users) { item in
//                    if item.email == viewModel.currentUserEmail {
//                        Text("Welcome \(item.username)!")
//                            .onAppear{
////                                users.getPurchases(email: item.email)
////                                users.getCurrentUsername(email: item.email)
////                                users.getSumSpent(email: item.email)
////                                prices.getPrice()
//                            }
//                        }
//                    }
//
                Text("the next available price is")
                
//                Text("$\(status_price)").font(.largeTitle).bold().foregroundColor(.red)
//                
//                NavigationLink(destination: ShopView()){
////                NavigationLink(destination: ShopView(price: prices.the_price, , users:users, pieces: pieces, prices: prices)){
//                    Text("BUY NOW!").bold()
//                }
//                .foregroundColor(Color.white)
//                .frame(width: 200, height: 20)
//                .background(Color.red)
//                .cornerRadius(8)
            }
//        .padding()
    }
}
