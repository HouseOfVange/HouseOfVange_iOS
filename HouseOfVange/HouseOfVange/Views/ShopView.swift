//
//  ShopView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/31/22.
//

import Foundation
import SwiftUI

struct ShopView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var users = UserViewModel()
    @ObservedObject var pieces = PieceViewModel()
    @ObservedObject var the_price = PriceViewModel()
    
//    @State var username = ""
    @State var cc_num = ""
    @State var fullname = ""
    @State var description = ""
    @State var phone_num = ""
    
    @State var bought: Bool = false
    @State private var showCongratsAlert = false
    
    var body: some View {
        
        if bought {
            //                Text("Congratulations! You purchased")
            //                Congratulations(price: prices.the_price)
            Congratulations()
            
        } else {
            
            VStack{
                
                NavBannerView()
//                Spacer()
                
                Text("This deal won't last forever, act fast!")
                    .bold().italic()
                Text("$\(the_price.the_price)").onAppear {
                    users.getCurrentUsername(email: viewModel.currentUserEmail)
                    users.getPurchases(email: viewModel.currentUserEmail)
                }
                
                Spacer()

                
                VStack {
//                    List{
                        TextField("full name", text: $fullname)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                        
                        TextField("phone", text: $phone_num)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                        
                        //            Text("required")
                        //                .foregroundColor(.red)
                        //                .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        TextField("credit card number", text: $cc_num)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                        //                .isNumeric
                        
                        TextField("what would you like?", text: $description)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                    
                        Button {
                            print("purchased")
                            
                            //PIECES COLLECTTION UPDATE
                            // update piece document with purchased = true, order date = Date.now, description = $description, username = username of current user
                            pieces.updatePieceBeingPurchased(pieceToUpdate: pieces.pieces[the_price.the_price - 1], description: description, email: viewModel.currentUserEmail)
                            
                            
                            // PRICE COLLECTION UPDATE
                            // increase price +1
                            the_price.increasePrice(priceToIncrease: the_price.the_price)
                
                            
                            //USER COLLECTION UPDATES
                            // update user document with price appended to purchases, and a sum spent, and cc num
                            users.updatePurchases(userToUpdateID: viewModel.currentUserEmail, price: the_price.the_price)
                            
                            users.updateSumSpent(email: viewModel.currentUserEmail)
                            
                            users.updateUserCCNum(userToUpdateID: viewModel.currentUserEmail, cc_num: cc_num)
                            
                            
                            //SHOP VIEW FIELDS RESET
                            //reset text fields
                            fullname = ""
                            phone_num = ""
                            cc_num = ""
                            description = ""
                            
                            //change bought to true
                            bought.toggle()
                            
                            //change to congrats alert true
                            showCongratsAlert = true
                            
                        } label: {
                            Text("CLICK TO BUY")
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .disabled(cc_num.isEmpty || description.isEmpty || fullname.isEmpty)
//                    }
                    
                    Spacer()
                }
                .padding()
                
            }
            Spacer()
        }
    }
    
    
    init() {
        pieces.getPieceData()
        users.getUserData()
        the_price.getPrice()
    }
}
