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
    @ObservedObject var the_price = PriceViewModel()
    
    @State private var isShopping: Bool = false
//    private var percent: Int = 0
    
    var body: some View {
        
        if isShopping {
            
            ShopView()
            
        } else {
        
        VStack {
//            NavBannerView()
            
            Text("Check out ur stats!")
                .bold().italic()
                .onAppear {
                    users.getUserData()
                }
            Text("📈")
            
            Spacer()
            
            List(users.users) { item in
                if item.email == viewModel.currentUserEmail {
                    
                    Text("\(item.username)")
                        .font(.largeTitle)
                        .bold()
                        .onAppear{
//                            users.getPercentOfBiz(count: item.purchases.count, price: the_price.the_price)
                        }
                    
                    Text("joined on HOV app on \(item.date_joined_app)")
                        .bold()
                        .padding()
                    Text("invested $\(item.sum_spent) total so far")
                        .bold()
                        .padding()
                    Text("purchased \(item.purchases.count) pieces")
                        .bold()
                        .padding()
                    
//                    percent = (item.purchases.count / the_price.the_price) * 100
                    
//                    Text("you are % \(users.percentOfBiz) of the house!")
//                        .bold()
//                        .padding()
                }
            }
            
            Spacer()
//        }
        
//         FOOTER WITH BUY BUTTON
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
    
    init(){
        users.getUserData()
        the_price.getPrice()
    }
    
}
