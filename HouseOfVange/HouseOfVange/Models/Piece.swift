//
//  Piece.swift
//  HouseOfVange
//
//  Created by Evangeline Spracklin on 1/27/22.
//

import Foundation

struct Piece: Identifiable {
    
    var id: String
    var price: Int
    var description: String
    var client_name: String
    var client_contact_info: String
    var order_date: String
    var delivery_date: String
    var img_url: String
    var purchased: Bool
    
}
