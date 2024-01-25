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
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        
        WindowGroup(id: "SolarSystem") {
            SolarSystemView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.8, height: 0.8, depth: 0.8, in: .meters)
        
//        ImmersiveSpace(id: "SolarSystem") {
//            SolarSystemView()
//        }
    }
    
    init() {
        PlanetRotationSystem.registerSystem()
    }
}
