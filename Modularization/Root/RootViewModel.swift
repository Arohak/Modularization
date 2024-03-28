//
//  RootViewModel.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation

final class RootViewModel: ObservableObject {    
    @Published var currentFeature: Feature
    
    init(currentFeature: Feature) {
        self.currentFeature = currentFeature
    }
}

extension RootViewModel {
    enum Feature {
        case home
        case detail(Int)
    }
}
