//
//  Planet.swift
//  Practice04_SolarSystem
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import Foundation

struct Planet: Hashable {
    var name: String
    var description: String
    var size: Float
    var rotationSpeed: Float
    var isFixedStar: Bool
    var revolutionRadius: Float
    var revolutionSpeed: Float
}
