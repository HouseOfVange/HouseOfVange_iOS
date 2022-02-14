//
//  ViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//

import Foundation
import Firebase

class PieceViewModel: ObservableObject {
    
    @Published var pieces = [Piece]()
    
    
//    func addData(username: String, cc_num: String){
//        let db = Firestore.firestore()
//        
//        db.collection("users").addDocument(data: ["username" : username, "cc_num" : cc_num]) { error in
//            if error == nil {
//                self.getData()
//            }
//        }
//    }
    
    func addUser(username: String, email: String){
        let db = Firestore.firestore()
        
        db.collection("users").addDocument(data: ["username" : username, "email": email]) { error in
            if error == nil {
                self.getData()
            }
        }
    }
    
    func updatePieceBeingPurchased(pieceToUpdate: Piece) {
        
        let db = Firestore.firestore()
        
        db.collection("pieces").document(pieceToUpdate.id).setData(["purchased" : true, "order_date": Date.now], merge: true) { error in
            if error == nil {
                self.getData()
            }
        }
    }
    
    func getData(){
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // read the documents at a specific path
        db.collection("pieces").getDocuments { snapshot, error in
            
            //check for errors
            if error == nil{
                // No errors
                
                if let snapshot = snapshot{
                    
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        //get all documents and create pieces
                        self.pieces = snapshot.documents.map { d in
                            
                            // create a Piece item for each document returned
                            return Piece(id: d.documentID,
                                         doc_id: d["doc_id"] as? String ?? "",
                                         price: d["price"] as? Int ?? 0,
                                         description: d["description"] as? String ?? "",
                                         client_name: d["client_name"] as? String ?? "",
                                         client_contact_info: d["client_contact_info"] as? String ?? "",
                                         order_date: d["order_date"] as? String ?? "",
                                         delivery_date: d["delivery_date"] as? String ?? "",
                                         img_url: d["img_url"] as? String ?? "",
                                         purchased: d["purchased"] as? Bool ?? false,
                                         year_created: d["year_created"] as? String ?? "0",
                                         is_finished: d["is_finished"] as? Bool ?? true,
                                         has_paid: d["has_paid"] as? Bool ?? false,
                                         notes: d["notes"] as? String ?? "",
                                         owner_username: d["owner_username"] as? String ?? ""
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
