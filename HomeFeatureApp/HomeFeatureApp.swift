//
//  HomeFeatureApp.swift
//  HomeFeatureApp
//
//  Created by Ara Hakobyan on 3/30/24.
//

import SwiftUI
import Home

@main
struct HomeFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(vm: HomeViewModelImpl(service: .live, navigator: .init()))
        }
    }
}
