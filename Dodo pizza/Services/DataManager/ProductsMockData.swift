//
//  ProductsMockData.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.10.2023.
//

import Foundation

final class ProductsMockData {
    
//    let productMockDataAPI = "https://apingweb.com/api/rest/21cf71315ed2fe984ef1560553bc0e5b20/products"
    
    func getURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/21cf71315ed2fe984ef1560553bc0e5b20/products"
        
        return urlComponents.url
    }

}
