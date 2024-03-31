//
//  File.swift
//  
//
//  Created by Ara Hakobyan on 3/29/24.
//

import Foundation
import SwiftUI

public struct ProductView: View {
    let brand: String
    let title: String
    let price: Int

    public init(brand: String, title: String, price: Int) {
        self.brand = brand
        self.title = title
        self.price = price
    }
    
    public var body: some View {
        VStack() {
            HStack {
                Spacer()
                Text(brand)
                    .font(.title)
                    .foregroundStyle(.orange)
                Spacer()
            }
            HStack {
                Text(title)
                    .font(.title2)
                Text("$ \(price)")
                    .font(.title2)
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
    }
}
