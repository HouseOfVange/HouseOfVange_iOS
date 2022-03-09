//
//  ShopFooter.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/14/22.
//

import Foundation
import SwiftUI

struct ShopFooterView: View {
    
    var body: some View{
        
        Text("")
            .navigationBarHidden(true)
        
        HStack{
            NavigationLink(destination: ShopView()) {

                Image(systemName: "cart")
                    .renderingMode(.original)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text(" BUY NOW ")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                
                Image(systemName: "cart")
                    .renderingMode(.original)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
        .foregroundColor(.white)
        .background(.red)
        .padding(5)
        .border(.white)
    }
}
