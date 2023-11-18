//
//  Banner.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 10.08.2023.
//

import Foundation

struct Banner: Codable {
    var image: String
    var name: String?
    var price: Int?
    var description: String?
    var isGrayButtonVisible = false
    var nutritionalValues: NutritionalValues?
//    var stories: [Stories]?
}

struct NutritionalValues: Codable {
    var energy: String
    var protein: String
    var fat: String
    var carbohydrates: String
    var weight: String
}

//struct Stories {
//    var image: String
//}
