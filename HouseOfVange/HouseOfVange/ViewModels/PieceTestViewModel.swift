//
//  ViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//

import Foundation
import Firebase

class PieceTestViewModel: ObservableObject {
    
    @Published var pieces_test = [PieceTest]()
    
//    func writePriceList(){
//        var prices: [Int] = []
//
//        for i in 1...1414 {
//            prices.append(i)
//        }
//        print(prices)
//    }
    
    func getData(){
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // read the documents at a specific path
        db.collection("pieces_test").getDocuments { snapshot, error in
            
            //check for errors
            if error == nil{
                // No errors
                
                if let snapshot = snapshot{
                    
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        //get all documents and create pieces
                        self.pieces_test = snapshot.documents.map { d in
                            
                            // create a Piece item for each document returned
                            return PieceTest(id: d.documentID,
                                             
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
