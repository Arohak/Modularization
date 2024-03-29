//
//  File.swift
//  
//
//  Created by Ara Hakobyan on 3/29/24.
//

import Foundation
import SwiftUI

public struct ProductView: View {
    let product: Product
    
    public init(product: Product) {
        self.product = product
    }
    
    public var body: some View {
        VStack() {
            HStack {
                Spacer()
                Text(product.brand)
                    .font(.title)
                    .foregroundStyle(.orange)
                Spacer()
            }
            HStack {
                Text(product.title)
                    .font(.title2)
                Text("$ \(product.price)")
                    .font(.title2)
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
    }
}
