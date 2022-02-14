//
//  LoginViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/3/22.
//

import Foundation
import SwiftUI
import FirebaseAuth

//class LoginViewModel: ObservableObject {
//
//    let auth = Auth.auth()
//
//    @Published var loggedIn = false
//    
//    var isLoggedIn: Bool {
//        return auth.currentUser != nil
//    }
//
//    func signIn(email: String, password: String){
//        auth.signIn(withEmail: email,
//                    password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            
//            DispatchQueue.main.async {
//                // Success
//                self?.loggedIn = true
//            }
//
//        }
//    }
//    func signUp(email: String, password: String){
//        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            
//            DispatchQueue.main.async {
//                // Success
//                self?.loggedIn = true
//            }
//        }
//    }
//}
