//
//  ContentView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/26/22.
//
import Foundation
import SwiftUI
import MarqueeText
import Firebase
import FirebaseAuth

struct ContentView: View{
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        MarqueeView()
        NavigationView {
            
            if viewModel.signedIn && viewModel.viewProfile {
                UserProfileView()
            } else if viewModel.signedIn && !viewModel.viewProfile{
                PortfolioView()
            }
            else {
                LoginView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
        
        MarqueeView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


