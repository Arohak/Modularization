//
//  ApiService.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Foundation
import Models

public struct ApiService {
    public let fetchProducts: () async throws -> [Product]
    public let fetchProduct: (Int) async throws -> Product
}

extension ApiService {
    static let baseURL = "https://dummyjson.com"
    
     public static let live = Self(
        fetchProducts: {
            let url = URL(string: "\(baseURL)/products")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Response.self, from: data)
            return result.products
        },
        fetchProduct: { id in
            let url = URL(string: "\(baseURL)/product/\(id)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Product.self, from: data)
            return result
        }
    )
    
    public static let mock = Self (
        fetchProducts: {
            [product, product, product]
        }, fetchProduct: { _ in
            product
        }
    )
    
    static let product = Product(id: 1, title: "iPhone", price: 100, brand: "Apple", thumbnail: "")
}

