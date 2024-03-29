//
//  DetailViewModel.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Combine
import Models
import Navigator
import Networking

public protocol DetailViewModel: ObservableObject {
    var product: Product? { get set }
    func fetchProduct()
}

final public class DetailViewModelImpl: DetailViewModel {
    private let service: ApiService
    private let navigator: Navigator<Route>

    private let id: Int
    
    @Published public var product: Product?
    
    public init(id: Int, service: ApiService, navigator: Navigator<Route>) {
        self.id = id
        self.service = service
        self.navigator = navigator
    }
    
    @MainActor public func fetchProduct() {
        Task {
            product = try? await service.fetchProduct(id)
        }
    }
}
