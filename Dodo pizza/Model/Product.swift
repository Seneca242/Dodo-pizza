//
//  Product.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 07.07.2023.
//

import Foundation

//struct Product: Codable {
//    var name: String
//    var detail: String
//    var price: Int
//    var image: String
//}

struct Product: Codable {
    var name: String
    var detail: String
    var sizeDetail: String
    var price: Int
    var image: String
    var quantity: Int = 1
}

