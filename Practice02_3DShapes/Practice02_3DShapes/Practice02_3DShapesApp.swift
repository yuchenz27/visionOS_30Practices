//
//  Practice02_3DShapesApp.swift
//  Practice02_3DShapes
//
//  Created by Yuchen Zhang on 2023/9/27.
//

import SwiftUI

@main
struct Practice02_3DShapesApp: App {
    var body: some Scene {
        WindowGroup {
            SphereView()
            BoxView()
        }
        .windowStyle(.volumetric)
    }
}
