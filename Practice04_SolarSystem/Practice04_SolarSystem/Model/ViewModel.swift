//
//  ViewModel.swift
//  Practice04_SolarSystem
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import SwiftUI
import RealityKit

@Observable
class ViewModel {
    var isShowingSolarSystem: Bool = false
    
    var planets: [Planet] = []
    
    var rootEntity: Entity?
    
    init() {
        loadPlanets()
    }
    
    private func loadPlanets() {
        planets = [
            Planet(name: "Sun", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Mercury", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Venus", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Earth", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Mars", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Jupiter", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Saturn", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Uranus", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10),
            Planet(name: "Neptune", description: "...", size: 0, rotationSpeed: 10, isFixedStar: true, revolutionRadius: 1, revolutionSpeed: 10)
        ]
    }
}
