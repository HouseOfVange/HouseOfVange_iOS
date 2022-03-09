//
//  GuestBookView.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/13/22.
//

import Foundation
import SwiftUI

struct GuestBookView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var the_price = PriceViewModel()
    @ObservedObject var posts = GuestBookViewModel()
    
    @State var goShopping: Bool = false
    
    @State var post_body = ""
    
//    var posts = ["This is the best app I've ever seeen", "incredible", "I love house of vange"]
    
    var body: some View{
//        NavBannerView()
        
        if goShopping{
            ShopView()
            Spacer()
        }else{
        
        Text("Sign the guestbook!")
            .bold().italic()
        Spacer()
        
        // Write a post
        
        VStack {
            TextEditor(text: $post_body)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
                .frame(height: 150)
        }
        
        Button{
            print("submit post")
            posts.addPost(message: post_body, email: viewModel.currentUserEmail)
            post_body = ""
        } label: {
            Image(systemName: "paperplane")
            Text("sign")
            Image(systemName: "signature")
        }
        .foregroundColor(Color.white)
        .frame(width: 200, height: 50)
        .background(Color.red)
        .disabled(post_body.isEmpty)
        
        
//        scroll posts
// A bunch of posts here
        VStack {
            List(posts.posts) { item in
                Text(item.message)
                }
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
                    goShopping.toggle()
                    
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
    }
    init() {
        posts.getPosts()
        the_price.getPrice()
    }
    
}
