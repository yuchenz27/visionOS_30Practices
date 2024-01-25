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
    
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        RealityView { content, attachments in
            if let entity = try? await Entity(named: "SolarSystem", in: realityKitContentBundle) {
                content.add(entity)
                viewModel.rootEntity = entity
            }
        } update: { content, attachments in
            for planet in viewModel.planets {
                if let attachmentEntity = attachments.entity(for: planet.name), let planetEntity = viewModel.rootEntity?.findEntity(named: planet.name) {
                    attachmentEntity.position = [0, -0.15, 0]
                    planetEntity.addChild(attachmentEntity)
                }
            }
        } attachments: {
            ForEach(viewModel.planets, id: \.self) { planet in
                if let entity = viewModel.rootEntity?.findEntity(named: planet.name) {
                    Attachment(id: entity.name) {
                        Text(entity.name)
                            .padding()
                            .glassBackgroundEffect()
                    }
                }
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            print("Tapped \(value.entity.name)!")
        })
        .onDisappear {
            viewModel.isShowingSolarSystem = false
        }
    }
}

#Preview {
    SolarSystemView()
        .previewLayout(.sizeThatFits)
}
