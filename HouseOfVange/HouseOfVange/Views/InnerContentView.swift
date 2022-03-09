//
//  InnerContentView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/17/22.
//

import Foundation
import SwiftUI

struct InnerContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var the_price = PriceViewModel()
    
    @State var goShopping: Bool = false
    @State var goStats: Bool = false
    @State var goFAQs: Bool = false
    @State var goBook: Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    goStats = true
                    print("goStats")
                }, label: {
                    VStack{
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .renderingMode(.original)
                            .foregroundColor(.white)
                        Text("stats")
                        //                        .foregroundColor(.white)
                        //                        .background(.red)
                    }
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                    .border(.white)
                })
                //                .cornerRadius(8)
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                //                .border(.white)
                
                Spacer()
                
                Button(action: {
                    
                    goFAQs = true
                    print("goFAQs")
                    
                }, label: {
                    VStack{
                        Image(systemName: "person.fill.questionmark")
                            .renderingMode(.original)
                            .foregroundColor(.white)
                        Text("bye")
                        //                        .foregroundColor(.white)
                        //                        .background(.red)
                    }
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                    .border(.white)
                })
                //                .cornerRadius(8)
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                //                .border(.white)
                
                Spacer()
                
                Button(action: {
                    
                    goBook = true
                    print("goBook")
                    
                }, label: {
                    VStack{
                        Image(systemName: "book")
                            .renderingMode(.original)
                            .foregroundColor(.white)
                        Text("g-book")
                        //                        .foregroundColor(.white)
                        //                        .background(.red)
                    }
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                    .border(.white)
                })
                //                .cornerRadius(8)
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                //                .border(.white)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.signOut()
                }, label: {
                    VStack{
                        Image(systemName: "peacesign")
                            .renderingMode(.original)
                            .foregroundColor(.white)
                        Text("bye")
                        //                        .foregroundColor(.white)
                        //                        .background(.red)
                    }
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                    .border(.white)
                })
                //                .cornerRadius(8)
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                //                .border(.white)
                
            }
            .frame(alignment: .topLeading)
            .foregroundColor(.white)
            .background(.red)
            //        .padding(5)
            
            Spacer()
            
            if goShopping {
                ShopView()
            } else if goStats {
                UserProfileView()
            }else if goFAQs {
                FAQsView()
            }else if goBook {
                GuestBookView()
            }else{
                AllPiecesView()
            }
            
            Spacer()
            
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
        
    }
    
    init() {
        the_price.getPrice()
    }
    
}
