//
//  Congratulations.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/10/22.
//
import SwiftUI
import Foundation

struct Congratulations: View {
    
//    @EnvironmentObject var viewModel: AppViewModel
    
//    @ObservedObject var users = UserViewModel()
//    @ObservedObject var pieces = PieceViewModel()
    @ObservedObject var the_price = PriceViewModel()
    
    @State private var isShopping: Bool = false
    
    var body: some View {
        
        
        VStack {
            NavBannerView()
            Spacer()
            //            Text("THE CURRENT PRICE VALUE IN DB \(the_price.the_price)")
            Text("Congratulations!")
                .font(.largeTitle)
                .bold().italic()
            Image("HOV_LOGO2")
            VStack{
            Text("You are now the official owner of")
                    .padding()
            Text("HOV #\(the_price.the_price - 1)")
                    .padding()
            }.padding()
            Spacer()
        }
    }
    
    // break between body and init()
    
    init() {
//        pieces.getPieceData()
//        users.getUserData()
        the_price.getPrice()
    }
    
}
