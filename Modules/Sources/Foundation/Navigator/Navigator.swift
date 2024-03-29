//
//  Navigator.swift
//  Modularization
//
//  Created by Ara Hakobyan on 3/29/24.
//

import Combine

public final class Navigator<Route: Hashable>: ObservableObject {
    @Published public var route = [Route]()
    
    public init() {}
}

public extension Navigator {
    func pop() {
        route.removeLast()
    }
    
    func push(_ route: Route) {
        self.route.append(route)
    }
    
    func popToRoot() {
        route.removeAll()
    }
}

public enum Route: Hashable {
    case home
    case detail(Int)
}
