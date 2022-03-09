//
//  FAQsView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/14/22.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let q: String
    let icon: String
    var items: [Question]?
    
    static let whatanswer = Question(q: "House Of Vange specializes in custom upcycled fashion with a twi$t.", icon: "bolt.heart")
//    static let whatanswer: String = "House Of Vange specializes in custom upcycled fashion with a twi$t. Our pricing model is one of the ways HOV stands out. After each sale the price for an HOV piece increases by $1. The first piece sold for $1, the second for $2, the third for $3, etc… increasing at a linear rate. - O(n)"
//
    
    static let howmuchanswer = Question(q: "After each sale the price for a HOV piece increases by $1. The first piece sold for $1, the second for $2, the third for $3, etc…", icon: "chart.line.uptrend.xyaxis.circle")
    
    static let whyanswer = Question(q: ".........why not?", icon: "lasso.and.sparkles")
//
    static let whenanswer = Question(q:"The House Of Vange will be complete after the sale of piece #1,414, which will bring GROSS profit over the $1,000,000 milestone!", icon: "tortoise")
//
//    static let howanswer = Question(q: "In one dollar bills $1 milllion weighs 2204.623 lbs!", icon: "sum")
    static let willanswer = Question(q: "No.", icon: "face.smiling")
                                   
    static let q1 = Question(q: "What the hell?", icon: "", items: [whatanswer])
    static let q1b = Question(q: "How much?", icon: "", items: [howmuchanswer])
    static let q2 = Question(q: "Why?", icon: "", items: [whyanswer])
    static let q3 = Question(q: "When will it end?!", icon: "", items: [whenanswer])
//    static let q4 = Question(q: "How much does one million dollars weigh?", icon: "", items: [howanswer])
    static let q4b = Question(q: "Will it ever be cheaper than now?", icon: "", items: [willanswer])
}

struct FAQsView: View {
    
    @ObservedObject var the_price = PriceViewModel()
    @State private var isShopping: Bool = false
    
        @State private var showAlert = false
    
        let timer = Timer.publish(every: 15, tolerance: 0.5, on: .main, in: .common).autoconnect()
        @State private var counter = 0
    
    var body: some View {
        
        if isShopping {
            
            ShopView()
            
        } else {
            
            let items: [Question] = [.q1, .q1b, .q2,.q3, .q4b]

            VStack{
//                NavBannerView()
                
                Text("You've got FAQs, HOV's got answers!")
                    .bold().italic()
                Text("💯")
                
                List(items, children: \.items) { row in
                    Image(systemName: row.icon)
                    Text(row.q)
                }
                
                Button("") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("BUY NOW!"),
                        message: Text("$\(the_price.the_price)! " + "it will never be cheaper!")
                    )
                }

                Text("")
                    .onReceive(timer) { time in
                        if counter == 1414 {
                            timer.upstream.connect().cancel()
                        } else {
                                                print("The time to buy is now \(time)")
                            showAlert = true
                        }
                        counter += 1
                    }

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
    
    init(){
        the_price.getPrice()
    }
}

