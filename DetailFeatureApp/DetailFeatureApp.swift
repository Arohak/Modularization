//
//  DetailFeatureApp.swift
//  DetailFeature
//
//  Created by Ara Hakobyan on 3/30/24.
//

import SwiftUI
import Detail

@main
struct DetailFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            DetailView(vm: DetailViewModelImpl(id: 5, service: .live, navigator: .init()))
        }
    }
}
