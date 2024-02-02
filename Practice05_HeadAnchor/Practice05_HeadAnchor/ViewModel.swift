//
//  ViewModel.swift
//  Practice05_HeadAnchor
//
//  Created by Yuchen Zhang on 2024/2/2.
//

import Observation
import RealityKit

@Observable
class ViewModel {
    var headAnchorEntity: Entity = {
        let headAnchor = AnchorEntity(.head)
        headAnchor.name = "Head_Anchor"
        headAnchor.position = [0.70, -0.35, -1]
        let radians = -30 * Float.pi / 180
        ViewModel.rotateEntityAroundAxix(entity: headAnchor, angle: radians, axis: [0, 1, 0])
        return headAnchor
    }()
    
    static func rotateEntityAroundAxix(entity: Entity, angle: Float, axis: SIMD3<Float>) {
        var currentTransform = entity.transform
        let rotation = simd_quatf(angle: angle, axis: axis)
        currentTransform.rotation = rotation * currentTransform.rotation
        entity.transform = currentTransform
    }
}
