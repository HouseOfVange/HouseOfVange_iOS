//
//  DetailView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//
import SwiftUI
import Foundation


struct PieceDetailView: View {
    
//    @ObservedObject var the_price = PriceViewModel()
    
    @State var goShopping: Bool = false
    
    var piece: Piece
    var price: Int
    
    var body: some View {
        
        if goShopping{
            ShopView()
        } else {
            
            VStack {
                
//                NavBannerView()
                VStack{
                    
//                    if piece.price == 14 {
//
//                    }
                    if piece.purchased == true && piece.is_finished == true {
                        
                        VStack{
                            Spacer()
                            
                            Text("The ")
                            + Text("\(piece.description)").bold()
                            + Text(" (\(piece.year_created)) was purchased by \(piece.client_name) for $\(piece.price).")
                            
                            
                            AsyncImage(url: URL(string: "\(piece.img_url)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .padding()
        
                            Spacer()
                        }
                        .padding()
                        
                        
                    }
                    
                    else if piece.purchased && piece.is_finished == false {
                        VStack{
                            Spacer()
                            
                            Text("The price point $\(piece.price) was purchased by \(piece.client_name) and the piece is in the process of becoming.")
                                .padding()
                            
                            AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/egg_cracking.gif?alt=media&token=aa65c6ae-a8ef-49d3-8ced-68f1efc0ea9b")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 300, height: 300)
                            
                            Spacer()
                        }
//                        Spacer()
                    }
                }
                
                
                // FOOTER WITH BUY BUTTON
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("the next available price point is")
                            .foregroundColor(.white)
                            .bold()
                        
//                        Text("$\(the_price.the_price)")
                        Text("$\(price)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        //Button that when pressed, toggles isShopping var
                        Button {
                            print("now shopping")
                            goShopping.toggle()
                            
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
    
//    init(){
//        the_price.getPrice()
//    }
    
}
