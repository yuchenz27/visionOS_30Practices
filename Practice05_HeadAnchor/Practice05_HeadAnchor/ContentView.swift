//
//  ContentView.swift
//  Practice05_HeadAnchor
//
//  Created by Yuchen Zhang on 2024/2/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Text("Attach the object to the user's head!")
                .font(.extraLargeTitle)
                .padding()
                .glassBackgroundEffect()
        }
        .onAppear {
            Task {
                await openImmersiveSpace(id: "ImmersiveSpace")
            }
        }
    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}
