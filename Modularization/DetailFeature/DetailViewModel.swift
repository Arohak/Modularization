//
//  DetailViewModel.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/28/24.
//

import Foundation
import Combine

protocol DetailViewModel: ObservableObject {
    var product: Product? { get set }
    func fetchProduct()
}

final class DetailViewModelImpl: DetailViewModel {
    private let service: ApiService
    private let navigator: Navigator<Route>

    private let id: Int
    
    @Published var product: Product?
    
    init(id: Int, service: ApiService, navigator: Navigator<Route>) {
        self.id = id
        self.service = service
        self.navigator = navigator
    }
    
    @MainActor func fetchProduct() {
        Task {
            product = try? await service.fetchProduct(id)
        }
    }
}
