//
//  Practice01_MyFirstImmersiveApp.swift
//  Practice01_MyFirstImmersive
//
//  Created by Yuchen Zhang on 2023/9/26.
//

import SwiftUI

@main
struct Practice01_MyFirstImmersiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
