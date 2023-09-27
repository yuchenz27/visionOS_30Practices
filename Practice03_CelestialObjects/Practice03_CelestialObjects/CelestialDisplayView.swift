//
//  CelestialDisplayView.swift
//  Practice03_CelestialObjects
//
//  Created by Yuchen Zhang on 2023/9/27.
//

import SwiftUI
import RealityKit

struct CelestialDisplayView: View {
    
    @State var celestialObjects = [CelestialObject(name: "Earth", size: 300, rotationSpeed: 5),
                                   CelestialObject(name: "Moon", size: 150, rotationSpeed: 8),
                                   CelestialObject(name: "Sun", size: 450, rotationSpeed: 3)]
    
    var body: some View {
        TimelineView(.animation) { context in
            HStack(spacing: 60) {
                ForEach(celestialObjects, id: \.self) { object in
                    CelestialObjectView(name: object.name)
                        .rotation3DEffect(
                            Rotation3D(
                                angle: Angle2D(degrees: object.rotationSpeed * context.date.timeIntervalSinceReferenceDate),
                                axis: .y
                            )
                        )
                        .frame(depth: object.size, alignment: .center)
                        .frame(width: object.size)
                        .overlay(alignment: .bottom) {
                            Text(object.name)
                                .padding()
                                .glassBackgroundEffect()
                        }
                }
            }
        }
    }
}

struct CelestialObject: Equatable, Hashable {
    var name: String
    var size: CGFloat
    var rotationSpeed: Double
}

struct CelestialObjectView: View {
    
    let name: String
    
    var body: some View {
        Model3D(named: name) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .failure(error):
                Text(error.localizedDescription)
            case let .success(model):
                model.resizable().scaledToFit()
            @unknown default:
                Text("unknown default")
            }
        }
    }
}

#Preview {
    CelestialDisplayView()
        .previewLayout(.sizeThatFits)
}
