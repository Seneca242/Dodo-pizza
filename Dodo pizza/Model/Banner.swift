//
//  Banner.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 10.08.2023.
//

import Foundation

struct Banner {
    var image: String
    var name: String?
    var price: Int?
    var description: String?
    var isGrayButtonVisible = false
    var nutritionalValues: NutritionalValues?
    var stories: [Stories]?
}

struct NutritionalValues {
    var energy: String
    var protein: String
    var fat: String
    var carbohydrates: String
    var weight: String
}

struct Stories {
    var image: String
}
