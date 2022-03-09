//
//  MillionView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/17/22.
//

import Foundation
import SwiftUI

struct MillionView: View {
    
    var body: some View {
        NavBannerView()
        Spacer()
        
        VStack{
//            Text("Maybe the real treasure was the friends/clients along the way")
//                .font(.largeTitle)
//                .padding()
            Text("🥲")
                .font(.largeTitle)
        }
        .padding()
        
//        Spacer()
        
        // FOOTER WITH BUY BUTTON
        Spacer()
        HStack{
            Spacer()
            VStack{
                Text("Maybe the real treasure was the")
                    .foregroundColor(.white)
                    .bold()
                
                Text("friends/clients")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                //Button that when pressed, toggles isShopping var
                Button {
                    
                } label: {
                    HStack{
                        Text("")
                        Image(systemName: "heart")
                        Text("  along the way ").font(.system(size:25))
                        Image(systemName: "star")
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
