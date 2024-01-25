import RealityKit

// Ensure you register this component in your app’s delegate using:
// PlanetRevolutionComponent.registerComponent()
public struct PlanetRevolutionComponent: Component, Codable {
    
//    public var center: SIMD3<Float> = SIMD3<Float>(repeating: 0.0)
    
    public var radius: Float = 0.3
    
    public var speed: Float = 0

    public init() {
    }
}
