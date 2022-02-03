//
//  ShopView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/31/22.
//

import Foundation
import SwiftUI

struct ShopView: View {
    
    @State private var name = ""
    @State private var contactinfo = ""
    @State private var whatwant = ""
    @State private var isTrue = "true"
    
    var price: Int
    
    let types = ["true", "false"]
    
    var body: some View {
    
        VStack{
            Text("WELCOME TO THE OFFICIAL HOV SHOPPE").font(.largeTitle).bold().foregroundColor(.red)
            Text("The next available price point is $\(price)")
            
            Form{
                TextField("Name", text: $name)
                TextField("Contact Info", text: $contactinfo)
                TextField("What do you want?", text: $whatwant)
                Picker("The time to buy is now!📈", selection: $isTrue){
                    Text("true")
                    Text("false")
                    }
                }
            }
        .pickerStyle(.segmented)
        }
    }

