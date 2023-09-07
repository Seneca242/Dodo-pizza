//
//  CategoryService.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 07.09.2023.
//

import Foundation

class CategoryService {
    private let categories: [Category] = [
       Category(name: "Пицца"),
       Category(name: "Комбо"),
       Category(name: "Закуски"),
       Category(name: "Коктейли"),
       Category(name: "Кофе"),
       Category(name: "Десерты"),
       Category(name: "Напитки"),
       Category(name: "Соусы"),
       Category(name: "Другие товары")
    ]
    
    func fetchCategories() -> [Category] {
        categories
    }
}
