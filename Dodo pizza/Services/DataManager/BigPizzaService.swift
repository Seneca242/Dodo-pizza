//
//  BigPizzaService.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 02.10.2023.
//

import Foundation

class BigPizzaService {
    private let bigPizzaProduct: Product =
        Product(
            name: "Трюфельная с мортаделлой",
            detail: "Мортаделла, трюфельный соус, моцарелла, красный лук, чеснок, шампиньоны и фирменный соус альфредо",
            price: 539,
            image: "truffleMordatellaPizza"
        )
    
    func fetchBigPizzaProduct() -> Product {
        bigPizzaProduct
    }
}
