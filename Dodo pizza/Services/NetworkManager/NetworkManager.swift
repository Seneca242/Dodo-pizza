//
//  NetworkManager.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.10.2023.
//

import Foundation

class NetworkManager {
    
    func fetchProductData(from url: URL, completion: @escaping(Result<[Product], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "no descripption")
                return
            }
            
            do {
                let product = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(product))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchBigPizzaData(from url: URL, completion: @escaping(Result<Product, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "no error description")
                return
            }
            
            do {
                let bigPizza = try JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(bigPizza))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchBannerData(from url: URL, completion: @escaping(Result<[Banner], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "no descripption")
                return
            }
            
            do {
                let banner = try JSONDecoder().decode([Banner].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(banner))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
