//
//  AppViewModel.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/12/22.
//
import Foundation
import SwiftUI
import MarqueeText
import Firebase
import FirebaseAuth


class AppViewModel: ObservableObject {
    
    @Published var auth = Auth.auth()
    
    @ObservedObject var users = UserViewModel()
    
    @Published var currentUserEmail: String = "koala~"
    //    var currentUserUID: String = "44444444444444~~~~55555555~~~666666"
    
    @Published var signedIn = false
    
    @Published var viewProfile = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
                self?.currentUserEmail = self!.auth.currentUser!.email!
                //                self?.currentUserUID = self!.auth.currentUser!.uid
                //                print("LOOOOOOOOK HERE inside signin *&*&*& \(self?.currentUserEmail)")
            }
            
        }
    }
    
    func signUp(email: String, password: String, username: String){
        
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
                self?.currentUserEmail = self!.auth.currentUser!.email!
                //                print("BBBBBBBUUUU^^^^ inside signup *&*&*& \(self?.currentUserEmail)")
                
                // ADD NEW USER INSTANCE HERE!
                self!.users.addUser(username: username, email: email)
                
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        //        self?.currentUserEmail = ""
    }
    
    func goToProfileView() {
        viewProfile.toggle()
    }
}
