//
//  Products.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Foundation

struct Response: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Int
    let brand: String
    let thumbnail: String
}
