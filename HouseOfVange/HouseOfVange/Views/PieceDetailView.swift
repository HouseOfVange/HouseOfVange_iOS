//
//  DetailView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//
import SwiftUI
import Foundation

struct PieceDetailView: View {
    
    var piece: Piece
    
    var body: some View {
        
        VStack {
            
            if piece.purchased == true && piece.is_finished == true{
                
                VStack{
                    Text("The ")
                    + Text("\(piece.description)").bold()
                    + Text(" (\(piece.year_created)) was purchased by \(piece.client_name) for $\(piece.price).")


                    AsyncImage(url: URL(string: "\(piece.img_url)")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding()
                }
                .padding()
            }

            else if piece.purchased && piece.is_finished == false {

                Text("The price point $\(piece.price) has been purchased by \(piece.client_name) and the piece is in the process of becoming.")
                    .padding()

                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/egg_cracking.gif?alt=media&token=aa65c6ae-a8ef-49d3-8ced-68f1efc0ea9b")) { image in
                                image.resizable()
                            } placeholder: {
                                Color.red
                            }
                            .frame(width: 300, height: 300)

            }
        }
        
        
        
        
        
//        Text("This is hard coded" + "Next step: detail view needs to inheret data, kinda like props in React. When working correctly this will display the piece's price, description, and purchaser")
//
//        AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/1.jpeg?alt=media&token=399220e3-31d5-40c6-9987-398740d1315b")) { image in
//            image.resizable()
//        } placeholder: {
//            Color.red
//        }
//        .frame(width: 300, height: 300)
        
//        AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/1.jpeg?alt=media&token=399220e3-31d5-40c6-9987-398740d1315b"))
//            .frame(width: 200, height: 200)
    }
}
