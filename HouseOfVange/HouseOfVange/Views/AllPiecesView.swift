//
//  AllPiecesView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/14/22.
//
import Foundation
import SwiftUI

struct AllPiecesView: View {

    @ObservedObject var pieces = PieceViewModel()
    @ObservedObject var the_price = PriceViewModel()
    
    var body: some View {
//        
        VStack {
            Text("🤝")
            List(pieces.pieces) { item in
//                NavigationLink(destination: PieceDetailView(piece: item, price: the_price.the_price)) {
//                    Button("$ \(item.price) - \(item.description)") {
//                    }
//                }
                if item.purchased == true  && item.is_finished == true {
                    NavigationLink(destination: PieceDetailView(piece: item, price: the_price.the_price)) {
                        Button("$ \(item.price) - \(item.description)") {
                        }
                    }
                }
                else if item.purchased == true && item.is_finished == false {
                    NavigationLink(destination: PieceDetailView(piece: item, price: the_price.the_price)) {
                        Button("$ \(item.price) - in progress") {
                        }
                    }
                    .foregroundColor(.gray)
                }
                else if item.price == the_price.the_price {
                    NavigationLink(destination: ShopView()) {
                        Button("$ \(item.price) - BUY! BUY! BUY!") {
                        }
                    }
                    .foregroundColor(.red)
                }else if item.price == 1000000{
                    NavigationLink(destination: MillionView()) {
                        Button("🎈😮 ONE MILLION DOLLARS 😮🎈") {
                        }
                    }
                    .foregroundColor(.pink)
                    .background(.yellow)
                }
                else{
                    NavigationLink(destination: ShopView()) {
                        Button("$\(item.price) - unavailable until current price point is sold") {
                        }
                    }
                    .foregroundColor(.gray)
                }
            }
        }
    }
    
    init() {
        pieces.getPieceData()
        the_price.getPrice()
    }
}
