//
//  RootView.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import SwiftUI
import Navigator
import Home
import Detail

//struct RootView: View {
//    @StateObject var viewModel: RootViewModel
//    @StateObject private var navigator: Navigator<Route>
//    
//    init() {
//        let navigator = Navigator<Route>()
//        _navigator = StateObject(wrappedValue: navigator)
//    }
//    
//    var body: some View {
//        switch viewModel.currentFeature {
//        case .home:
//            HomeView(vm: HomeViewModelImpl(service: .live, navigator: navigator))
//        case let .detail(id):
//            DetailView(vm: DetailViewModelImpl(id: id, service: .live, navigator: navigator))
//        }
//    }
//}

struct RootView: View {
    @StateObject private var navigator: Navigator<Route>
    
    init() {
        let navigator = Navigator<Route>()
        _navigator = StateObject(wrappedValue: navigator)
    }
    
    public var body: some View {
        NavigationStack(path: $navigator.route) {
            VStack {
                Button("Home") {
                    navigator.push(.home)
                }
                .buttonStyle(.plain)
                
                Button("Detail") {
                    navigator.push(.detail(1))
                }
                .buttonStyle(.plain)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    HomeView(vm: HomeViewModelImpl(service: .live, navigator: navigator))
                case let .detail(id):
                    DetailView(vm: DetailViewModelImpl(id: id, service: .live, navigator: navigator))
                }
            }
        }
    }
}
