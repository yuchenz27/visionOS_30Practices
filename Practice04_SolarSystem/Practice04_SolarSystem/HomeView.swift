//
//  HomeView.swift
//  Practice04_SolarSystem
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSolarSystem: Bool = false
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        VStack {
            Text("Solar System")
                .font(.largeTitle)
            
            Spacer()
                .frame(height: 86)
            
            Toggle(showSolarSystem ? "Hide Solar System" : "Show Solar System", isOn: $showSolarSystem)
                .toggleStyle(.button)
        }
        .onChange(of: showSolarSystem) { _, newValue in
            Task {
                if newValue {
                    openWindow(id: "SolarSystem")
                } else {
                    dismissWindow(id: "SolarSystem")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
