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
            detail: "Мортаделла , трюфельный соус, шампиньоны , красный лук , моцарелла, фирменный соус альфредо, чеснок", 
            sizeDetail: "30 см, традиционное тесто, 620 г",
            price: 539,
            image: "truffleMordatellaPizza"
        )
    
    func fetchBigPizzaProduct() -> Product {
        bigPizzaProduct
    }
}
