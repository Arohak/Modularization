//
//  DetailView.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import SwiftUI
import Models
import Views

public struct DetailView<VM: DetailViewModel>: View {
    @StateObject var vm: VM
    
    public init(vm: VM) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    public var body: some View {
        VStack {
            if let product = vm.product {
                ProductView(brand: product.brand, title: product.title, price: product.price)
            } else {
                Text("Loading")
            }
        }
        .padding()
        .task {
            vm.fetchProduct()
        }
    }
}

#Preview {
    DetailView(vm: DetailViewModelImpl(id: 3, service: .live, navigator: .init()))
}
