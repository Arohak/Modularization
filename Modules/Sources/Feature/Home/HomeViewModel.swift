//
//  HomeViewModel.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Combine
import Models
import Navigator
import Networking

public protocol HomeViewModel: ObservableObject {
    var products: [Product]? { get set }
    
    func fetchProducts()
    func showDetail(for product: Product)
}

final public class HomeViewModelImpl: HomeViewModel {
    private let service: ApiService
    private let navigator: Navigator<Route>
    
    @Published public var products: [Product]?
    
    public init(service: ApiService, navigator: Navigator<Route>) {
        self.service = service
        self.navigator = navigator
    }
    
    @MainActor public func fetchProducts() {
        Task {
            do {
                products = try await service.fetchProducts()
            } catch {
                
            }
        }
    }
    
    public func showDetail(for product: Product) {
        navigator.push(.detail(product.id))
    }
}



