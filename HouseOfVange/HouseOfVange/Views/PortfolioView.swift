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
    @ObservedObject var the_price = PriceViewModel()
    
//    @State private var showAlert = false
    
    @State private var isShopping: Bool = false
    @State var isHome: Bool = true
    
//    @State private var showAlert = false
//
//    let timer = Timer.publish(every: 15, tolerance: 0.5, on: .main, in: .common).autoconnect()
//    @State private var counter = 0
    
    var body: some View {
        
        VStack {
            
            if isShopping {
                
                ShopView()
                
            } else {
                
                VStack {
                    
                    NavBannerView()
                    
                    //                                    Annoyting alert pop up
//                                                        Button("") {
//                                                            showAlert = true
//                                                        }
//                                                        .alert(isPresented: $showAlert) {
//                                                            Alert(
//                                                                title: Text("BUY NOW!"),
//                                                                message: Text("$\(the_price.the_price)! " + "it will never be cheaper!")
//                                                            )
//                                                        }
//               
//                                                        Text("")
//                                                            .onReceive(timer) { time in
//                                                                if counter == 1414 {
//                                                                    timer.upstream.connect().cancel()
//                                                                } else {
//                                                                    //                    print("The time to buy is now \(time)")
//                                                                    showAlert = true
//                                                                }
//                                                                counter += 1
//                                                            }
                    
                    ForEach(users.users) { item in
                        if item.email == viewModel.currentUserEmail {
                            Text("Hi \(item.username)!")
                                .bold().italic()
                        }
                    }
                    
                    
                    
                    // LISTS HERE
                    AllPiecesView()
                    
                    // FOOTER WITH BUY BUTTON
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text("the next available price point is")
                                .foregroundColor(.white)
                                .bold()
                            
                            Text("$\(the_price.the_price)")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                            
                            //Button that when pressed, toggles isShopping var
                            Button {
                                print("now shopping")
                                isShopping.toggle()
                                
                            } label: {
                                HStack{
                                    Text("")
                                    Image(systemName: "cart")
                                    Text(" BUY NOW! ").font(.system(size:25))
                                    Image(systemName: "bag")
                                    Text("")
                                }
                            }
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(8)
                            .border(.white)
                            .padding(.bottom, 5)
                        }
                        Spacer()
                    }
                    .background(.red)
                }
                Spacer()
            }
        }
    }

    
    init() {
        pieces.getPieceData()
        users.getUserData()
        the_price.getPrice()
    }
    
}


// LOG DURATION ON APP STUFF

//        ScrollView{
//        Text("Hello, world!")
//            .padding()
//            .onChange(of: scenePhase) { newPhase in
//                if newPhase == .active {
//                    print("Active")
//                    loginTime = Date.now
//                } else if newPhase == .inactive {
//                    print("Inactive")
//                } else if newPhase == .background {
//                    print("Background")
//                    print(duration)
//                }
//            }
//        Text("")
//            .navigationBarHidden(true)
