//
//  Practice05_HeadAnchorApp.swift
//  Practice05_HeadAnchor
//
//  Created by Yuchen Zhang on 2024/2/2.
//

import SwiftUI

@main
struct Practice05_HeadAnchorApp: App {
    
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.plain)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(viewModel)
        }
    }
}
