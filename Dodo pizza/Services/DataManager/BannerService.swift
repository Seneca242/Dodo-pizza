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
        image: "brusletikiBanner",
        name: "Бруслетики",
        price: 230,
        description: "Это задорные сладкие рулетики, в которых закрутился микс из натуральной брусники и сгущённого молока",
        isGrayButtonVisible: true,
        nutritionalValues: NutritionalValues(
            energy: "337,6 ккал",
            protein: "6,2 г",
            fat: "3,5 г",
            carbohydrates: "68,2 г",
            weight: "260 г"
        )
       ),
       Banner(
        image: "pepperoniFreshBanner",
        name: "Пепперони фреш",
        price: 299,
        description: "Пикантная пепперони , увеличенная порция моцареллы, томаты , фирменный томатный соус",
        nutritionalValues: NutritionalValues(
            energy: "257,9 ккал",
            protein: "10,5 г",
            fat: "9,8 г",
            carbohydrates: "30,1 г",
            weight: "590 г"
        )
       ),
       Banner(
        image: "dodsterBanner",
        name: "Додстер",
        price: 169,
        description: "Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке",
        nutritionalValues: NutritionalValues(
            energy: "211,4 ккал",
            protein: "11,9 г",
            fat: "9,9 г",
            carbohydrates: "17,1 г",
            weight: "210 г"
        )
       ),
       Banner(
        image: "threePizzasBanner",
        name: "3 пиццы",
        price: 1099,
        description: "Три удовольствия в нашем меню — это 3 средние пиццы на ваш выбор. Цена комбо зависит от выбранных пицц и может быть увеличена",
        nutritionalValues: NutritionalValues(
            energy: "292,8 ккал",
            protein: "10,8 г",
            fat: "10,6 г",
            carbohydrates: "36,7 г",
            weight: "470 г"
        )
       ),
       Banner(
        image: "comboBanner",
        name: "Комбо",
        price: 599,
        description: "Если хочется всего понемногу. Маленькая пицца, закуска, напиток и соус. Цена комбо зависит от выбранных продуктов и может быть увеличена",
        nutritionalValues: NutritionalValues(
            energy: "256 ккал",
            protein: "11,4 г",
            fat: "8,3 г",
            carbohydrates: "32,1 г",
            weight: "370 г"
        )
       ),
       Banner(
        image: "twoSaucesBanner",
        name: "2 соуса",
        price: 75,
        description: "Комбинируйте пары соусов для ярких перекусов"
       )
    ]
    
    func fetchBanners() -> [Banner] {
        banners
    }
}


