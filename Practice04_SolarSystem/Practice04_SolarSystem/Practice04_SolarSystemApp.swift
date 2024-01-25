//
//  Practice04_SolarSystemApp.swift
//  Practice04_SolarSystem
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import SwiftUI
import RealityKitContent

@main
struct SolarSystemApp: App {
    
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(viewModel)
        }
        
        WindowGroup(id: "SolarSystem") {
            SolarSystemView()
                .environment(viewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.8, height: 0.6, depth: 1.8, in: .meters)
        
//        ImmersiveSpace(id: "SolarSystem") {
//            SolarSystemView()
//        }
    }
    
    init() {
        PlanetRotationSystem.registerSystem()
        PlanetRevolutionSystem.registerSystem()
    }
}
