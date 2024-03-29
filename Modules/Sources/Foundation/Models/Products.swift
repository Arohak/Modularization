//
//  Products.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Foundation

public struct Response: Decodable {
    public let products: [Product]
}

public struct Product: Decodable, Identifiable {
    public let id: Int
    public let title: String
    public let price: Int
    public let brand: String
    public let thumbnail: String
    
    public init(id: Int, title: String, price: Int, brand: String, thumbnail: String) {
        self.id = id
        self.title = title
        self.price = price
        self.brand = brand
        self.thumbnail = thumbnail
    }
}
