//
//  DetailView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//
import SwiftUI
import Foundation

struct DetailView: View {
    var body: some View {
        
        Text("This is hard coded" + "Next step: detail view needs to inheret data, kinda like props in React. When working correctly this will display the piece's price, description, and purchaser")
        
        AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/1.jpeg?alt=media&token=399220e3-31d5-40c6-9987-398740d1315b")) { image in
            image.resizable()
        } placeholder: {
            Color.red
        }
        .frame(width: 300, height: 300)
        
//        AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/house-of-vange-ios.appspot.com/o/1.jpeg?alt=media&token=399220e3-31d5-40c6-9987-398740d1315b"))
//            .frame(width: 200, height: 200)
    }
}
