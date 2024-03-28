//
//  HomeView.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import SwiftUI

struct HomeView<VM: HomeViewModel>: View {
    @StateObject var vm: VM
    
    var body: some View {
        List(vm.products) { product in
            ProductView(product: product)
                .onTapGesture {
                    vm.showDetail(for: product)
                }
        }
        .task {
            vm.fetchProducts()
        }
    }
}

struct ProductView: View {
    let product: Product
    
    var body: some View {
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

#Preview {
    HomeView(vm: HomeViewModelImpl(service: .live, navigator: .init()))
}
