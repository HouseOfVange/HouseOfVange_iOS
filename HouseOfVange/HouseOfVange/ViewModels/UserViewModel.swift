//
//  UserViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/9/22.
//

import Foundation
import Firebase
import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    @Published var purchases: [Int] = []
    @Published var sum_spent: Int = 0
    @Published var currentUsername: String = "SHRIMP HEAD"
    @Published var percentOfBiz: Int = 0
//    @Published var date_joined_app: Date.now
    
    func getPercentOfBiz(count: Int, price: Int){
        let num = count/price
        self.percentOfBiz = num*100
//        self.percentOfBiz = 777
        print(self.percentOfBiz)
        self.getUserData()
    }
    
    func addUser(username: String, email: String){
        
        let db = Firestore.firestore()
        
        let newUserData: [String: Any] = [
            "name": email,
            "email": email,
            "purchases": [],
            "username": username,
            "cc_num": "0",
            "phone number": "",
            "date_joined_app": Date.now,
            "app_seshes": [],
            "sum_spent": 0
        ]
        
        let docRef = db.collection("users").document(email)
        
        docRef.setData(newUserData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
                self.getUserData()
            }
        }
    }
    
    //update
    func updateUserCCNum(userToUpdateID: String, cc_num: String) {

        let db = Firestore.firestore()

        db.collection("users").document(userToUpdateID).setData(["cc_num" : cc_num], merge: true) { error in
            if error == nil {
                self.getUserData()
            }
        }
    }
   
    // get number of purchases
    func getPurchases(email: String){
//        print("user bought hekka shrimp")
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(email)

            docRef.getDocument { (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }

                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        print("PRICES PURCHASE ARE:", data)
                        self.purchases = data["purchases"] as? [Int] ?? [0]
                    }
                }
                self.getUserData()
//                print(self.purchases)
//                print("   old purchases list ---- ^^ LOOK HERE  VANGE    ")
            }

    }
        
    //update purchases list
    func updatePurchases(userToUpdateID: String, price: Int) {
//        self.getPurchases(email: userToUpdateID)
        
        let db = Firestore.firestore()
        
        self.purchases.append(price)
        
        db.collection("users").document(userToUpdateID).setData(["purchases" : purchases], merge: true) { error in
            if error == nil {
                self.getUserData()
//                print(self.purchases)
//                print("   new purchases list ---- ^^ LOOK HERE  VANGE    ")
            }
        }
    }
 
    func updateSumSpent(email: String){
        let db = Firestore.firestore()
        
        let theSum: Int = self.purchases.reduce(0, +)
        
        self.sum_spent = theSum
        
        db.collection("users").document(email).setData(["sum_spent": theSum], merge: true) { error in
            if error == nil {
                self.getUserData()
            }
        }
        
    }
    
    func getSumSpent(email: String){
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(email)

            docRef.getDocument { (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }

                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        print("data", data)
                        self.sum_spent = data["sum_spent"] as? Int ?? 206
                    }
                }
                self.getUserData()
                print(self.sum_spent)
            }
    }
    
    func getCurrentUsername(email: String){
//        print("user bought hekka shrimp")
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(email)

            docRef.getDocument { (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }

                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        print("data", data)
                        self.currentUsername = data["username"] as? String ?? "CHEVY CHASE lol"
                    }
                    self.getUserData()
                    print(self.currentUsername)
                }
//                self.getUserData()
//                print(self.currentUsername)
            }
    }
    

    
    
    func getUserData(){
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // read the documents at a specific path
        db.collection("users").getDocuments { snapshot, error in
            
            //check for errors
            if error == nil{
                // No errors
                
                if let snapshot = snapshot{
                    
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        //get all documents and create pieces
                        self.users = snapshot.documents.map { d in
                            
                            // create a Piece item for each document returned
                            return User(id: d.documentID,
                                        username: d["username"] as? String ?? "",
                                        email: d["email"] as? String ?? "",
                                        cc_num: d["cc_num"] as? String ?? "",
                                        purchases: d["purchases"] as? [Int] ?? [],
                                        date_joined_app: d["date_joined_app"] as? Date ?? Date.now,
                                        sum_spent: d["sum_spent"] as? Int ?? 0
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
