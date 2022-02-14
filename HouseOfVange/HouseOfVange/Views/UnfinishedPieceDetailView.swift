//
//  DetailView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//
import SwiftUI
import Foundation

struct UnfinishedPieceDetailView: View {
    
    var piece: PieceTest
    
//    let egg_img_url = "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/egg_cracking.gif?alt=media&token=aa65c6ae-a8ef-49d3-8ced-68f1efc0ea9b"
//
    var body: some View {
        
        VStack {
            Text("The price point $\(piece.price) has been purchased and the piece is in the process of becoming.")
                .padding()
//            Text("The ")
//            + Text("\(piece.description)").bold()
//            + Text(" (\(piece.year_created)) was purchased by \(piece.client_name) for $\(piece.price).")
//
//            AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/egg_cracking.gif?alt=media&token=aa65c6ae-a8ef-49d3-8ced-68f1efc0ea9b")) { image in
//                image.resizable()
//            } placeholder: {
//                Color.red
//            }
//            .frame(width: 300, height: 300)
        }
    }
}
