//
//  GuestBookViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/28/22.
//

import Foundation
import Firebase
import SwiftUI

class GuestBookViewModel: ObservableObject {
    
    @Published var posts = [GuestBookPost]()
    
    
    func addPost(message: String, email: String){
        
        let db = Firestore.firestore()
        
        // read the documents at a specific path
        db.collection("guestbookposts")
            .addDocument(data: ["email": email, "date" : Date.now, "user": "Vange's username", "message": message]) {error in
            
            if error == nil {
                self.getPosts()
            }
            else{
                //
            }
            
        }
    }
    
    func getPosts(){
        // get a reference to the database
        let db = Firestore.firestore()
        
        // read the documents at a specific path
        db.collection("guestbookposts").getDocuments { snapshot, error in
            
            //check for errors
            if error == nil{
                // No errors
                
                if let snapshot = snapshot{
                    
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        //get all documents and create pieces
                        self.posts = snapshot.documents.map { d in
                            
                            // create a Piece item for each document returned
                            return GuestBookPost(id: d.documentID,
//                                                 id: d["id"] as? String ?? "",
                                                 username: d["owner_username"] as? String ?? "",
                                                 message: d["message"] as? String ?? "",
                                                 date: d["date"] as? Date ?? Date.now
                            )
                        }
                    }
                    
                }
            }
            else {
                // Handle error
                
            }
        }
        
    }
}

