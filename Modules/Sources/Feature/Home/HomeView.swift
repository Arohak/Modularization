//
//  HomeView.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import SwiftUI
import Models

public struct HomeView<VM: HomeViewModel>: View {
    @StateObject var vm: VM
    
    public init(vm: VM) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    public var body: some View {
        VStack {
            if let products = vm.products {
                List(products) { product in
                    ProductView(product: product)
                        .onTapGesture {
                            vm.showDetail(for: product)
                        }
                }
            } else {
                Text("Loading")
            }
        }
        .task {
            vm.fetchProducts()
        }
    }
}

#Preview {
    HomeView(vm: HomeViewModelImpl(service: .live, navigator: .init()))
}
