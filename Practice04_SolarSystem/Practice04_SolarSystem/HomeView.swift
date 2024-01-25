//
//  HomeView.swift
//  Practice04_SolarSystem
//
//  Created by Yuchen Zhang on 2024/1/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        ZStack {
            VStack {
                Text("Solar System")
                    .font(.largeTitle)
                
                Spacer()
                    .frame(height: 86)
                
                Toggle(viewModel.isShowingSolarSystem ? "Hide Solar System" : "Show Solar System", isOn: $viewModel.isShowingSolarSystem)
                    .toggleStyle(.button)
            }
        }
        .onChange(of: viewModel.isShowingSolarSystem) { _, newValue in
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
        .environment(ViewModel())
}
