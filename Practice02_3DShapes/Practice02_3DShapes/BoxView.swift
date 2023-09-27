//
//  BoxView.swift
//  Practice02_3DShapes
//
//  Created by Yuchen Zhang on 2023/9/27.
//

import SwiftUI
import RealityKit

struct BoxView: View {
    
    @State private var rotation = Angle.zero
    
    var body: some View {
        VStack {
            RealityView { content in
                let model = ModelEntity(mesh: .generateBox(size: [0.1, 0.1, 0.1]),
                                        materials: [SimpleMaterial(color: .green, isMetallic: false)])
                model.components.set(CollisionComponent(shapes: [.generateBox(size: [0.1, 0.1, 0.1])]))
                model.components.set(InputTargetComponent())
                
                content.add(model)
            }
            .rotation3DEffect(rotation, axis: .y)
            .gesture(TapGesture().targetedToAnyEntity().onEnded({ _ in
                withAnimation(.bouncy) {
                    rotation.degrees += 165
                }
            }))
            
            Text("Tap To Rotate The Box")
                .font(.headline)
                .padding()
                .glassBackgroundEffect()
        }
    }
}

#Preview {
    BoxView()
}
