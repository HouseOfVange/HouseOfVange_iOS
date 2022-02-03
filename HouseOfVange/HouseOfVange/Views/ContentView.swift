//
//  ContentView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/26/22.
//

import SwiftUI
import MarqueeText
import MovingNumbersView

struct ContentView: View {
    
    @ObservedObject var pieces = PieceViewModel()
    
    @State private var showAlert = false
    
    let timer = Timer.publish(every: 4, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    @State var currentPrice = 67
    
    var body: some View {
        
//        Button("") {
//                showAlert = true
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("BUY NOW!"),
//                    message: Text("$\(currentPrice)! " + "it will never be cheaper!")
//                )
//            }
        
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
        
        MarqueeText(
             text: "The time to buy is now!📈 The time to buy is now!📈 The time to buy is now!📈 The time to buy is now!📈 The time to buy is now!📈 ",
             font: UIFont.preferredFont(forTextStyle: .subheadline),
             leftFade: 0,
             // 16
             rightFade: 0,
             startDelay: 0,
             alignment: .topLeading
             )

        NavigationView {
            VStack {
                NavigationLink(destination: LoginView()){
                    Text("LOGIN").bold()
                }
                Text("next available price point")
                Text("$\(currentPrice)").font(.largeTitle).bold().foregroundColor(.red)
                
                var grossProfit = 0
                ForEach(1..<67, id(: \.self) { i in
//                    Text("i is \(i)")
                    grossProfit += i
                }
                Spacer()
                
                MovingNumbersView(
                    number: Double(currentPrice),
                    numberOfDecimalPlaces: 0) { str in
                        // How to build each character
                        Text(str)
                            .font(.largeTitle)
                }
                    .mask(LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: .clear, location: 0),
                                Gradient.Stop(color: .black, location: 0.2),
                                Gradient.Stop(color: .black, location: 0.8),
                                Gradient.Stop(color: .clear, location: 1.0)]),
                            startPoint: .top,
                            endPoint: .bottom))
                            
                NavigationLink(destination: ShopView(price: currentPrice)){
                    Text("BUY NOW!").bold()
                }

                            
                List(pieces.pieces) { item in
                    NavigationLink(destination: PieceDetailView(piece: item)) {
                        Button("$ \(item.price) - \(item.description)") {
                            print("yum")
                        }
                    }
                }
                        
            }
        }
        
        MarqueeText(
             text: "The time to buy is now! 📈 The time to buy is now! 📈 The time to buy is now! 📈 The time to buy is now! 📈 The time to buy is now! 📈",
             font: UIFont.preferredFont(forTextStyle: .subheadline),
             leftFade: 0,
             // 16
             rightFade: 0,
             startDelay: 0,
             alignment: .topLeading
             )
        
    }
    
    init() {
        pieces.getData()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

