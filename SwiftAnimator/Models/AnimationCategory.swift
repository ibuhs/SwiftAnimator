import SwiftUI

enum AnimationCategory: String, CaseIterable, Identifiable {
    case basic = "Basic"
    case spring = "Spring"
    case transition = "Transition"
    case keyframe = "Keyframe"
    case path = "Path"
    case gesture = "Gesture"
    case physics = "Physics"
    case morph = "Morphing"
    case particle = "Particles"
    case sequence = "Sequence"
    case advanced = "Advanced"

    var id: String { rawValue }

    var title: String { rawValue }

    var gradient: LinearGradient {
        switch self {
        case .basic:
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .spring:
            LinearGradient(colors: [.orange, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .transition:
            LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .keyframe:
            LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .path:
            LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .gesture:
            LinearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .physics:
            LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .morph:
            LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .particle:
            LinearGradient(colors: [.mint, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .sequence:
            LinearGradient(colors: [.indigo, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .advanced:
            LinearGradient(colors: [.purple, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }

    var icon: String {
        switch self {
        case .basic: "square.and.pencil"
        case .spring: "spring"
        case .transition: "arrow.left.and.right.righttriangle.left.righttriangle.right"
        case .keyframe: "key"
        case .path: "point.3.connected.trianglepath.dotted"
        case .gesture: "hand.tap"
        case .physics: "atom"
        case .morph: "square.on.circle"
        case .particle: "sparkles"
        case .sequence: "list.number"
        case .advanced: "star.circle.fill"
        }
    }

    var description: String {
        switch self {
        case .basic:
            "Learn fundamental animations like scaling, rotating, and moving views"
        case .spring:
            "Explore spring-based animations with customizable parameters"
        case .transition:
            "Discover different ways to transition views in and out"
        case .keyframe:
            "Create complex multi-step animations with precise timing"
        case .path:
            "Animate views along custom paths and curves"
        case .gesture:
            "Interactive animations driven by user gestures and touches"
        case .physics:
            "Realistic physics-based animations with gravity and collisions"
        case .morph:
            "Smooth transformations between shapes and colors"
        case .particle:
            "Create engaging particle effects and systems"
        case .sequence:
            "Chain multiple animations in coordinated sequences"
        case .advanced:
            "Complex animations combining multiple techniques and effects"
        }
    }

    @ViewBuilder
    func previewContent(isAnimating: Bool) -> some View {
        switch self {
        case .basic:
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .scaleEffect(isAnimating ? 1.5 : 1)
                .opacity(isAnimating ? 0.5 : 1)
        case .spring:
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .offset(y: isAnimating ? 30 : -30)
        case .transition:
            HStack {
                if isAnimating {
                    Circle()
                        .fill(.white)
                        .frame(width: 40, height: 40)
                        .transition(.slide)
                }
            }
        case .keyframe:
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
        case .path:
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .offset(x: isAnimating ? 50 : -50, y: isAnimating ? -30 : 30)
        case .gesture:
            Image(systemName: "hand.tap.fill")
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .scaleEffect(isAnimating ? 1.2 : 1.0)
                .opacity(isAnimating ? 0.7 : 1.0)
        case .physics:
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .offset(y: isAnimating ? 50 : -50)
                .rotationEffect(.degrees(isAnimating ? 180 : 0))
        case .morph:
            if isAnimating {
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                    .transition(.scale)
            } else {
                Rectangle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                    .transition(.scale)
            }
        case .particle:
            ZStack {
                ForEach(0..<5) { i in
                    Circle()
                        .fill(.white)
                        .frame(width: 10, height: 10)
                        .offset(
                            x: isAnimating ? CGFloat.random(in: -30...30) : 0,
                            y: isAnimating ? CGFloat.random(in: -30...30) : 0
                        )
                        .opacity(isAnimating ? 0 : 1)
                }
            }
        case .sequence:
            HStack(spacing: 8) {
                ForEach(0..<3) { i in
                    Circle()
                        .fill(.white)
                        .frame(width: 15, height: 15)
                        .scaleEffect(isAnimating ? 1.5 : 1)
                        .opacity(isAnimating ? 0.5 : 1)
                }
            }
        case .advanced:
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                    .scaleEffect(isAnimating ? 1.2 : 0.8)
                    .opacity(isAnimating ? 0.8 : 1)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .offset(y: isAnimating ? -20 : 0)
                
                ForEach(0..<4) { i in
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 10, height: 10)
                        .offset(
                            x: isAnimating ? cos(Double(i) * .pi / 2) * 30 : 0,
                            y: isAnimating ? sin(Double(i) * .pi / 2) * 30 : 0
                        )
                        .opacity(isAnimating ? 0 : 1)
                }
            }
        }
    }
}
