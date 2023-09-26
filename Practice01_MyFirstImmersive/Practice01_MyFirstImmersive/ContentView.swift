//
//  ContentView.swift
//  Practice01_MyFirstImmersive
//
//  Created by Yuchen Zhang on 2023/9/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var enlarge = false
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            RealityView { content in
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
            } update: { content in
                if let scene = content.entities.first {
                    let uniformScale: Float = enlarge ? 1.4 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded{ _ in
                enlarge.toggle()
            })
            
            VStack {
                Toggle("Enlarge", isOn: $enlarge)
                    .toggleStyle(.button)
                
                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
            }
            .padding()
            .glassBackgroundEffect()
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
