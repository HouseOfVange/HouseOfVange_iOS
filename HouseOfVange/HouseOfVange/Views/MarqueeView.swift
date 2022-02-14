//
//  MarqueeView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/3/22.
//

import Foundation
import SwiftUI
import MarqueeText

struct MarqueeView: View {

    
    var body: some View {
        
        MarqueeText(
             text: "The time to buy is now! 📈 The time to buy is now! 📈 The time to buy is now! 📈 The time to buy is now! 📈 The time to buy is now! 📈",
             font: UIFont.preferredFont(forTextStyle: .subheadline),
             leftFade: 0,
             // 16
             rightFade: 0,
             startDelay: 0,
             alignment: .topLeading
             )
//            .background(.blue)
        //                .rotationEffect(.degrees(-90))
        }
}
