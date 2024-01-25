//
//  SolarSystemView.swift
//  Practice04_SolarSystem
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SolarSystemView: View {
    
    @State private var rotateY: Double = 0
    
    var body: some View {
        RealityView { content in
            if let entity = try? await Entity(named: "SolarSystem", in: realityKitContentBundle) {
                content.add(entity)
            }
        }
    }
}

#Preview {
    SolarSystemView()
        .previewLayout(.sizeThatFits)
}
