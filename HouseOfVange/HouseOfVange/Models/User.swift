//
//  User.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 2/2/22.
//

import Foundation

struct User: Identifiable {
    
    var id: String
    var username: String
    var email: String
    var cc_num: String
    var purchases: [Int]
    var date_joined_app: Date
    var sum_spent: Int
    
}
