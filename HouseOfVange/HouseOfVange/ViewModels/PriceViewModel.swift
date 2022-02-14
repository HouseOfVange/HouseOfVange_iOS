//
//  PriceViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/10/22.
//

import SwiftUI
import Foundation
import Firebase

class PriceViewModel: ObservableObject {
    
    @Published var the_price: Int = 0
    
    func getPrice(){
        let db = Firestore.firestore()
        
        let docRef = db.collection("price").document("price")
        
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.the_price = data["currentPrice"] as? Int ?? 0
                }
            }
            
        }
    }
    
    func increasePrice(priceToIncrease: Int){
        let db = Firestore.firestore()
    
        db.collection("price").document("price").setData(["currentPrice" : priceToIncrease + 1]) { error in
            if error == nil {
                self.getPrice()
            }
        }
        
    }
    
//    func updatePieceBeingPurchased(pieceToUpdate: Piece) {
//
//        let db = Firestore.firestore()
//
//        db.collection("pieces_test").document(pieceToUpdate.id).setData(["purchased" : true, "order_date": "TODAY"], merge: true) { error in
//            if error == nil {
//                self.getData()
//            }
//        }
//    }
}
