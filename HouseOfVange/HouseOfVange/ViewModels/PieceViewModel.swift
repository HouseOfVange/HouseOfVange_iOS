//
//  ViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//

import Foundation
import Firebase

class PieceViewModel: ObservableObject {
    
    @Published var list = [Piece]()
    
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
        db.collection("pieces").getDocuments { snapshot, error in
            
            //check for errors
            if error == nil{
                // No errors
                
                if let snapshot = snapshot{
                    
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        //get all documents and create pieces
                        self.list = snapshot.documents.map { d in
                            
                            // create a Piece item for each document returned
                            return Piece(id: d.documentID,
                                         price: d["price"] as? Int ?? 9999,
                                         description: d["description"] as? String ?? "",
                                         client_name: d["client_name"] as? String ?? "",
                                         client_contact_info: d["client_contact_info"] as? String ?? "",
                                         order_date: d["order_date"] as? String ?? "",
                                         delivery_date: d["delivery_date"] as? String ?? "",
                                         img_url: d["img_url"] as? String ?? "",
                                         purchased: d["purchased"] as? Bool ?? false)
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
