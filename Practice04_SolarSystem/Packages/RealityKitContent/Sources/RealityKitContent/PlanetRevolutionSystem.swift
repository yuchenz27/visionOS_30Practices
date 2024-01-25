//
//  File.swift
//  
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import RealityKit

public class PlanetRevolutionSystem: System {
    
    private static let query = EntityQuery(where: .has(PlanetRevolutionComponent.self))
    
    private var elapsedTime: Double = 0.0
    
    public required init(scene: Scene) {
        
    }
    
    public func update(context: SceneUpdateContext) {
        elapsedTime += context.deltaTime
        
        context.scene.performQuery(Self.query).forEach { entity in
            if let planet = entity.components[PlanetRevolutionComponent.self] {
                let angle = Float(elapsedTime) * planet.speed * .pi / 180.0
                let x = planet.radius * cos(angle)
                let z = planet.radius * sin(angle)
                let position = SIMD3<Float>(x, 0, z)
                
                entity.position = position
            }
        }
    }
}

