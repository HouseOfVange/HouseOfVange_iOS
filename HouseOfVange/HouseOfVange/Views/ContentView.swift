//
//  ContentView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pieces = PieceViewModel()
    
    @State private var showAlert = false
    
    let timer = Timer.publish(every: 4, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    @State var currentPrice = 67

    
    var body: some View {
        
//        Text("The time to buy is now!📈")
//            .padding()
        
        Button("") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("BUY NOW!"),
                    message: Text("$\(currentPrice)! " + "it will never be cheaper!")
                )
            }
        
        Text("The time to buy is now!📈")
                    .onReceive(timer) { time in
                        if counter == 1414 {
                            timer.upstream.connect().cancel()
                        } else {
                            print("The time to buy is now \(time)")
                            showAlert = true
                        }
                        counter += 1
                    }
        
//        List(pieces.list) { item in
//            Button("$ \(item.price) - \(item.description)") {
//                print("yum")
//            }
//        }
        
        NavigationView {
                    VStack {
                        List(pieces.list) { item in
                        
                        NavigationLink(destination: DetailView()) {
                            Button("$ \(item.price) - \(item.description)") {
                                print("yum")
                            }
                        }
                        }
                    }
                }
        
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

