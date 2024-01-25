//
//  File.swift
//  
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import RealityKit

public class PlanetRotationSystem: System {
    
    // Define an entity query that returns all entities with a PlanetRotationComponent
    private static let query = EntityQuery(where: .has(PlanetRotationComponent.self))
    
    public required init(scene: Scene) {
        
    }
    
    public func update(context: SceneUpdateContext) {
        context.scene.performQuery(Self.query).forEach { entity in
            if let planet = entity.components[PlanetRotationComponent.self] {
                let radians = planet.speed * Float.pi / 180.0 * Float(context.deltaTime)
                let newOrientation = entity.orientation * simd_quatf(angle: radians, axis: SIMD3<Float>(0, 1, 0))
                entity.setOrientation(newOrientation, relativeTo: nil)
            }
        }
    }
}
