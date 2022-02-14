//
//  LogOutButton.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/9/22.
//

import SwiftUI
import Foundation

struct LogOutButton: View {
    
    var viewModel: AppViewModel
    
    var body: some View {
        
        Button(action: {
            viewModel.signOut()
        }, label: {
            Text("leave house")
                .foregroundColor(Color.blue)
        })
//            .padding()
//            .background(.white)
            .foregroundColor(Color.white)
//            .frame(width: 200, height: 50)
            .background(Color.red)
            .cornerRadius(8)
    }
}
