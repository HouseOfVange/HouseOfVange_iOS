//
//  ShopView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/31/22.
//

import Foundation
import SwiftUI

struct ShopView: View {
    
    //    @State private var name = ""
    //    @State private var contactinfo = ""
    //    @State private var whatwant = ""
    //    @State private var isTrue = "true"
//    @State private var confirmationShown = false
    
    var price: Int
    
    @EnvironmentObject var viewModel: AppViewModel
    var pieces: PieceViewModel
    var prices: PriceViewModel
    @ObservedObject var users = UserViewModel()
    
    
//    @State var username = ""
    @State var cc_num = ""
    @State var fullname = ""
    
    @State var bought: Bool = false
//    private var current_user: User
    
    var body: some View {
        
        VStack(spacing:5){
            
            if bought {
                Text("Congratulations!")
//                Congratulations(price: prices.the_price)
            }
            
            Text("This deal won't last forever, act fast!")
            Text("$\(pieces.pieces[price-1].price)")
            Text("It'll never be cheaper!")
            
            Spacer()
            
            TextField("full name", text: $fullname)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            TextField("credit card number", text: $cc_num)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
//                .isNumeric
            
            Spacer()
            
            Button {
                print("purchased")
                
                // update piece document with purchased = true, order date = Date.now
                pieces.updatePieceBeingPurchased(pieceToUpdate: pieces.pieces[price-1])
                
                // increase price +1
                prices.increasePrice(priceToIncrease: prices.the_price)
                
                //get purchases
                users.getPurchases(email: viewModel.currentUserEmail)
                
                // update user document with price appended to purchases, and a
                users.updatePurchases(userToUpdateID: viewModel.currentUserEmail, price: price)
                
//                , purchases: users.purchases
                
                // update user's credit card number
                users.updateUserCCNum(userToUpdateID: viewModel.currentUserEmail, cc_num: cc_num)
//
                //reset text fields
//                username = ""
                fullname = ""
                cc_num = ""
                //change bought to true
                bought.toggle()
    
                
                //update user data with cc_num, add price point to [purchases] list
//                pieces.addData(username: username, cc_num: cc_num)
                
                //refresh pieces
//                pieces.getData()
                
            } label: {
                Text("CLICK TO BUY")
            }
            .foregroundColor(Color.white)
            .frame(width: 200, height: 50)
            .background(Color.red)
            .cornerRadius(8)
        }
        
    }
}
