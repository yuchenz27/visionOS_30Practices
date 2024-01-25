import RealityKit

// Ensure you register this component in your app’s delegate using:
// PlanetRotationComponent.registerComponent()
public struct PlanetRotationComponent: Component, Codable {
    // This is an example of adding a variable to the component.
    public var Speed: Float = 0

    public init() {
    }
}
