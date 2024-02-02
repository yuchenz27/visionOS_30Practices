//
//  ImmersiveView.swift
//  Practice05_HeadAnchor
//
//  Created by Yuchen Zhang on 2024/2/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    @State private var rootEntity: Entity?
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "ToyDrummer", in: realityKitContentBundle) {
                
                print("scene.name: \(scene.name)")
                print("scene.children[0].name: \(scene.children[0].name)")
                print("scene.children[0].children[0].name: \(scene.children[0].children[0].name)")
                
                viewModel.headAnchorEntity.addChild(scene)
                content.add(viewModel.headAnchorEntity)
                
                rootEntity = scene
                let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//                    print("rootEntity?.position: \(rootEntity?.position), rootEntity?.orientation: \(rootEntity?.orientation)")
                    
//                    print("viewModel.headAnchorEntity.position: \(viewModel.headAnchorEntity.position), viewModel.headAnchorEntity.orientation: \(viewModel.headAnchorEntity.orientation), viewModel.headAnchorEntity.transform: \(viewModel.headAnchorEntity.transform)")
                    
//                    print("viewModel.headAnchorEntity.position(relativeTo: nil): \(viewModel.headAnchorEntity.position(relativeTo: nil)), viewModel.headAnchorEntity.orientation(relativeTo: nil): \(viewModel.headAnchorEntity.orientation(relativeTo: nil))")
                    //print("rootEntity?.parent?.parent: \(rootEntity?.parent?.parent?.parent?.parent?.parent)")
                }
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
        .environment(ViewModel())
}
