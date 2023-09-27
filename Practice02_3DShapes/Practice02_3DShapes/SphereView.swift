//
//  SphereView.swift
//  Practice02_3DShapes
//
//  Created by Yuchen Zhang on 2023/9/27.
//

import SwiftUI
import RealityKit

struct SphereView: View {
    
    @State private var enlarge = false
    
    var body: some View {
        VStack {
            RealityView { content in
                let model = ModelEntity(mesh: .generateSphere(radius: 0.1),
                                        materials: [SimpleMaterial(color: .white, isMetallic: true)])
                model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
                model.components.set(InputTargetComponent())
                
                content.add(model)
            } update: { content in
                if let model = content.entities.first {
                    model.transform.scale = enlarge ? [1.4, 1.4, 1.4] : [1.0, 1.0, 1.0]
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded({ _ in
                enlarge.toggle()
            }))
            
            Text("Tap To Enlarge The Sphere")
                .font(.headline)
                .padding()
                .glassBackgroundEffect()
        }
    }
}

#Preview {
    SphereView()
}
