//
//  PortfolioView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/3/22.
//

import Foundation
import SwiftUI
import MarqueeText
import MovingNumbersView
struct PortfolioView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var users = UserViewModel()
    @ObservedObject var pieces = PieceViewModel()
    @ObservedObject var prices = PriceViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    @State private var showAlert = false
    
//    private var now = Date.now
//    private var loginTime: RelativeDateTimeFormatter = 0
//    private var logoutTime:Double = 0
//    private var duration: Double = 0
    
    var body: some View {
        
        VStack {
            HStack {
                
//                Text("Hello, world!")
//                    .padding()
//                    .onChange(of: scenePhase) { newPhase in
//                        if newPhase == .active {
//                            print("Active")
//                            loginTime = Date.now
//                        } else if newPhase == .inactive {
//                            print("Inactive")
//                        } else if newPhase == .background {
//                            print("Background")
//                            print(duration)
//                        }
//                    }
                Button {
                    print("look at user profile!")
                    users.sumPurchases(email: viewModel.currentUserEmail)
                    viewModel.goToProfileView()
                    
                } label: {
                    Text("ur stats")
                        .foregroundColor(.white)
                        .background(.red)
                        .padding()
                }
                .cornerRadius(8)
                .padding()
                
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
                    .padding()
            }
            .frame(alignment: .topLeading)
            .padding()
            
            
            HStack {
                VStack {
//                    Image("HOV_LOGO")
                    ForEach(users.users) { item in
                        if item.email == viewModel.currentUserEmail {
                            Text("Welcome \(item.username)!")
                                .onAppear{
                                    users.getPurchases(email: item.email)
                                }
                        }
                    }
                    
                    //                    Text("Welcome \(viewModel.currentUserEmail)")
                    Text("the next available price is")
                        .onAppear {
                            //                            print("THIS IS WHERE THE EMAIL WILL PRINT **** \(viewModel.currentUserEmail)")
                            //                            users.getUserByEmail(userid: "\(viewModel.currentUserEmail)")
                        }
                    Text("$\(prices.the_price)").font(.largeTitle).bold().foregroundColor(.red)
                    NavigationLink(destination: ShopView(price: prices.the_price, pieces: pieces, prices: prices, users:users)){
                        Text("BUY NOW!").bold()
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(8)
                }
            }
            .padding()
            
            VStack {
                List(pieces.pieces) { item in
                    
                    if item.purchased == true  && item.is_finished == true {
                        
                        NavigationLink(destination: PieceDetailView(piece: item)) {
                            Button("$ \(item.price) - \(item.description)") {
                            }
                        }
                        .foregroundColor(.blue)
                    }
                    else if item.purchased == true && item.is_finished == false {
                        
                        NavigationLink(destination: PieceDetailView(piece: item)) {
                            Button("$ \(item.price) - \(item.description)") {
                            }
                        }
                        .foregroundColor(.orange)
                    }
                    else if item.price == prices.the_price {
                        NavigationLink(destination: ShopView(price: prices.the_price, pieces: pieces, prices:prices, users:users)) {
                            Button("$ \(item.price) - BUY! BUY! BUY!") {
                            }
                        }
                        .foregroundColor(.red)
                    }
                    else {
                        NavigationLink(destination: ShopView(price: prices.the_price, pieces: pieces, prices: prices, users:users)) {
                            Button("🪨 $ \(item.price) 🪨 FROZEN UNTIL CURRENT PRICE POINT IS SOLD") {
                            }
//                            Button("🪨 $ \(item.price) 🪨") {
//                                showAlert = true
//                            }
//                            .alert(isPresented: $showAlert) {
//                                Alert(
//                                    title: Text("BUY NOW!"),
//                                    message: Text("$\(prices.the_price) IS FROZEN UNTIL THE CURRENT PRICE POINT IS SOLD")
//                                )
//                            }
                        }
                        .foregroundColor(.gray)
                    }
                    
                }
                .padding()
            }
            .padding()
                                    }
    }
    
    init() {
        pieces.getData()
        users.getUserData()
        prices.getPrice()
    }
    
}
