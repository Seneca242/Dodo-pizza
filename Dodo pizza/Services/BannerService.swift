//
//  BannerService.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 10.08.2023.
//

import Foundation

class BannerService {
    private let banners: [Banner] = [
       Banner (
        image: "brusletiki",
        name: "Бруслетики",
        price: 230
       ),
       Banner(
        image: "pepperoni fresh",
        name: "Пепперони фреш",
        price: 299
       ),
       Banner(
        image: "dodster",
        name: "Додстер",
        price: 169
       ),
       Banner(
        image: "threePizzas",
        name: "3 пиццы",
        price: 1099
       ),
       Banner(
        image: "combo",
        name: "Комбо",
        price: 599
       )
    ]
    
    func fetchBanners() -> [Banner] {
        banners
    }
}
