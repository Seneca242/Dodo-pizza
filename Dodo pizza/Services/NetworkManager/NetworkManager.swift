//
//  NetworkManager.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.10.2023.
//

import Foundation

class NetworkManager {
    
    func fetchData(from url: String, completion: @escaping(Result<[Product], Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
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
}

//class ImageManager {
//    static var shared = ImageManager()
//    
//    private init() {}
//    
//    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, let response = response else {
//                print(error?.localizedDescription ?? "No Description")
//                return
//            }
//            
//            guard url == response.url else { return }
//            
//            DispatchQueue.main.async {
//                completion(data, response)
//            }
//        }.resume()
//    }
//}
