//
//  GuestBookViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/28/22.
//

//import Foundation
//import Firebase
//import SwiftUI
//
//class GuestBookViewModel: ObservableObject {
//    @Published var list = [GuestBookPost]()
//    
//    func addPost(message: String){
//        
//        let db = Firestore.firestore()
//        
//        // read the documents at a specific path
//        db.collection("guestbookposts").addDocument(data: ["date" : date, "user": user, "message": message]) {error in
//            
//            if error == nil {
//                self.getData()
//            }
//            else{
//                //
//            }
//            
//        }
//    }
//}
