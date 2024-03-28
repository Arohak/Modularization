//
//  ApiService.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Foundation

struct ApiService {
    let fetchProducts: () async throws -> [Product]
    let fetchProduct: (Int) async throws -> Product
}

extension ApiService {
    static let baseURL = "https://dummyjson.com"
    
    static let live = Self(
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
}

