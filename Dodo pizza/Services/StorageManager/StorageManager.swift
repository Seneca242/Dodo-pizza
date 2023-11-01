//
//  StorageManager.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 11.10.2023.
//

import Foundation

final class StorageManager {
    
//MARK: Services
    private let userDefaults = UserDefaults.standard
    
//MARK: - Properties
    private let key = "product"
    
//MARK: - Private
    
//MARK: - Public

    func save(product: Product, quantity: Int = 1) {
        var products = fetchProducts()
        if let index = products.firstIndex(where: { $0.name == product.name }) {
            products[index].quantity += quantity
        } else {
            products.append(product)
        }
        guard let data = try? JSONEncoder().encode(products) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchProducts() -> [Product] {
        guard let data = userDefaults.object(forKey: key) as? Data else { return [] }
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else { return [] }
        return products
    }
    
    func deleteProduct(at index: Int) {
        var products = fetchProducts()
        products.remove(at: index)
        guard let data = try? JSONEncoder().encode(products) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func updateProductQuantity(product: Product, newQuantity: Int) {
        var storedProducts = fetchProducts()
        if let index = storedProducts.firstIndex(where: { $0.name == product.name }) {
            storedProducts[index].quantity = newQuantity
            guard let data = try? JSONEncoder().encode(storedProducts) else { return }
            userDefaults.set(data, forKey: key)
        }
    }
}
