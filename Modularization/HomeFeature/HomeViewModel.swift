//
//  HomeViewModel.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Foundation
import Combine

protocol HomeViewModel: ObservableObject {
    var products: [Product] { get set }
    
    func fetchProducts()
    func showDetail(for product: Product)
}

final class HomeViewModelImpl: HomeViewModel {
    private let service: ApiService
    private let navigator: Navigator<Route>
    
    @Published var products: [Product] = []
    
    init(service: ApiService, navigator: Navigator<Route>) {
        self.service = service
        self.navigator = navigator
    }
    
    @MainActor func fetchProducts() {
        Task {
            do {
                products = try await service.fetchProducts()
            } catch {
                
            }
        }
    }
    
    func showDetail(for product: Product) {
        navigator.push(.detail(product.id))
    }
}



