import SwiftUI

struct AnimationExample: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: AnimationCategory
    let codePreview: String
    let usageExample: String
    let explanation: AnimationExplanation
    
    @ViewBuilder
    var content: (Bool) -> any View
}

struct AnimationExplanation {
    let overview: String
    let keyConcepts: [AnimationConcept]
    let tips: [String]
}

struct AnimationConcept {
    let title: String
    let description: String
}

extension AnimationExample {
    
    
   
    
   
    
  // Update the keyframeExamples array in AnimationExample.swift
 
  struct LoadingValues {
      var scale = 1.0
      var opacity = 1.0
      var rotation = Angle.zero
  }
   
  // Add this to AnimationExample.swift after the pathExamples array
  static let gestureExamples: [AnimationExample] = [
      AnimationExample(
          title: "Drag & Scale",
          description: "Interactive drag gesture with scaling",
          category: .gesture,
          codePreview: #"""
          Circle()
              .scaleEffect(isDragging ? 1.2 : 1.0)
              .offset(offset)
              .gesture(
                  DragGesture()
                      .onChanged { value in
                          offset = value.translation
                          isDragging = true
                      }
                      .onEnded { _ in
                          withAnimation(.spring()) {
                              offset = .zero
                              isDragging = false
                          }
                      }
              )
              .animation(.spring(), value: isDragging)
          """#,
          usageExample: #"""
          struct DragScaleView: View {
              @State private var offset = CGSize.zero
              @State private var isDragging = false
              
              var body: some View {
                  Circle()
                      .fill(.blue)
                      .frame(width: 100, height: 100)
                      .scaleEffect(isDragging ? 1.2 : 1.0)
                      .offset(offset)
                      .gesture(
                          DragGesture()
                              .onChanged { value in
                                  offset = value.translation
                                  isDragging = true
                              }
                              .onEnded { _ in
                                  withAnimation(.spring()) {
                                      offset = .zero
                                      isDragging = false
                                  }
                              }
                      )
                      .animation(.spring(), value: isDragging)
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Demonstrates how to combine drag gestures with scaling animations for interactive feedback.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Drag Gesture",
                      description: "Tracks finger movement and updates view position."
                  ),
                  AnimationConcept(
                      title: "Interactive Feedback",
                      description: "Provides visual feedback during interaction with scaling."
                  )
              ],
              tips: [
                  "Use spring animations for natural movement",
                  "Provide clear visual feedback during interaction",
                  "Consider adding haptic feedback",
                  "Add bounds checking for drag limits"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.blue)
                  .frame(width: 50, height: 50)
                  .scaleEffect(isAnimating ? 1.2 : 1.0)
          }
      ),

      AnimationExample(
          title: "Rotation Gesture",
          description: "Interactive rotation with angle tracking",
          category: .gesture,
          codePreview: #"""
          Rectangle()
              .rotationEffect(angle)
              .gesture(
                  RotationGesture()
                      .onChanged { value in
                          angle = value
                      }
                      .onEnded { _ in
                          withAnimation(.spring()) {
                              angle = .zero
                          }
                      }
              )
          """#,
          usageExample: #"""
          struct RotationGestureView: View {
              @State private var angle: Angle = .zero
              
              var body: some View {
                  Rectangle()
                      .fill(.purple)
                      .frame(width: 100, height: 100)
                      .rotationEffect(angle)
                      .gesture(
                          RotationGesture()
                              .onChanged { value in
                                  angle = value
                              }
                              .onEnded { _ in
                                  withAnimation(.spring()) {
                                      angle = .zero
                                  }
                              }
                      )
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Shows how to implement rotation gestures with smooth animations.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Rotation Gesture",
                      description: "Tracks two-finger rotation gestures."
                  ),
                  AnimationConcept(
                      title: "Angle Tracking",
                      description: "Updates rotation based on gesture angle."
                  )
              ],
              tips: [
                  "Use spring animations for natural reset",
                  "Consider snapping to specific angles",
                  "Add rotation limits if needed",
                  "Combine with other gestures for rich interaction"
              ]
          ),
          content: { isAnimating in
              Rectangle()
                  .fill(.purple)
                  .frame(width: 50, height: 50)
                  .rotationEffect(.degrees(isAnimating ? 180 : 0))
          }
      ),AnimationExample(
        title: "Multi-Touch Transform",
        description: "Interactive drag, rotation, and pinch gestures",
        category: .gesture,
        codePreview: #"""
        struct TransformState {
            var offset = CGSize.zero
            var rotation = Angle.zero
            var scale: CGFloat = 1.0
        }
        
        Rectangle()
            .fill(gradient)
            .frame(width: 100, height: 100)
            .offset(state.offset)
            .rotationEffect(state.rotation)
            .scaleEffect(state.scale)
            .gesture(
                SimultaneousGesture(
                    SimultaneousGesture(
                        DragGesture()
                            .onChanged { value in
                                state.offset = value.translation
                            }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    state.offset = .zero
                                }
                            },
                        RotationGesture()
                            .onChanged { angle in
                                state.rotation = angle
                            }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    state.rotation = .zero
                                }
                            }
                    ),
                    MagnificationGesture()
                        .onChanged { scale in
                            state.scale = scale
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                state.scale = 1.0
                            }
                        }
                )
            )
        """#,
        usageExample: #"""
        struct MultiTouchTransformView: View {
            @State private var state = TransformState()
            
            let gradient = LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            var body: some View {
                Rectangle()
                    .fill(gradient)
                    .frame(width: 100, height: 100)
                    .offset(state.offset)
                    .rotationEffect(state.rotation)
                    .scaleEffect(state.scale)
                    .gesture(
                        SimultaneousGesture(
                            SimultaneousGesture(
                                DragGesture()
                                    .onChanged { value in
                                        state.offset = value.translation
                                    }
                                    .onEnded { _ in
                                        withAnimation(.spring()) {
                                            state.offset = .zero
                                        }
                                    },
                                RotationGesture()
                                    .onChanged { angle in
                                        state.rotation = angle
                                    }
                                    .onEnded { _ in
                                        withAnimation(.spring()) {
                                            state.rotation = .zero
                                        }
                                    }
                            ),
                            MagnificationGesture()
                                .onChanged { scale in
                                    state.scale = scale
                                }
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        state.scale = 1.0
                                    }
                                }
                        )
                    )
            }
        }
        """#,
        explanation: AnimationExplanation(
            overview: "Creates a fully interactive view that responds to multiple simultaneous touch gestures, similar to photo manipulation interfaces.",
            keyConcepts: [
                AnimationConcept(
                    title: "Simultaneous Gestures",
                    description: "Combines multiple gesture recognizers to handle different interactions at the same time."
                ),
                AnimationConcept(
                    title: "Transform State",
                    description: "Maintains a combined state object for all transformations."
                ),
                AnimationConcept(
                    title: "Spring Reset",
                    description: "Uses spring animations to smoothly reset to the original state."
                )
            ],
            tips: [
                "Use SimultaneousGesture to handle multiple touch interactions",
                "Consider adding gesture state indicators for better feedback",
                "Add haptic feedback for more immersive interactions",
                "Implement bounds checking for scale and movement limits",
                "Consider adding momentum for more natural feel"
            ]
        ),
        content: { isAnimating in
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 50, height: 50)
                .scaleEffect(isAnimating ? 1.2 : 1.0)
                .rotationEffect(.degrees(isAnimating ? 45 : 0))
                .offset(x: isAnimating ? 20 : 0, y: isAnimating ? -20 : 0)
        }
    )
  ]
  // Add this to AnimationExample.swift
  static let physicsExamples: [AnimationExample] = [
      AnimationExample(
          title: "Gravity Drop",
          description: "Physics-based falling animation",
          category: .physics,
          codePreview: #"""
          Circle()
              .offset(y: isAnimating ? UIScreen.main.bounds.height - 100 : 0)
              .animation(
                  .spring(
                      response: 0.6,
                      dampingFraction: 0.7,
                      blendDuration: 0.7
                  ),
                  value: isAnimating
              )
          """#,
          usageExample: #"""
          struct GravityDropView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  VStack {
                      Circle()
                          .fill(.blue)
                          .frame(width: 50, height: 50)
                          .offset(y: isAnimating ? UIScreen.main.bounds.height - 100 : 0)
                          .animation(
                              .spring(
                                  response: 0.6,
                                  dampingFraction: 0.7,
                                  blendDuration: 0.7
                              ),
                              value: isAnimating
                          )
                          .onTapGesture {
                              isAnimating.toggle()
                          }
                  }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Simulates gravity using spring animation with carefully tuned parameters.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Gravity Simulation",
                      description: "Uses spring animation to mimic natural falling motion."
                  ),
                  AnimationConcept(
                      title: "Spring Parameters",
                      description: "Tuned for realistic gravitational acceleration and bounce."
                  )
              ],
              tips: [
                  "Adjust response for different gravity strengths",
                  "Use damping to control bounce intensity",
                  "Consider adding rotation during fall",
                  "Add sound effects for impact"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.blue)
                  .frame(width: 50, height: 50)
                  .offset(y: isAnimating ? 200 : 0)
          }
      ),

      AnimationExample(
          title: "Collision Bounce",
          description: "Physics-based collision response",
          category: .physics,
          codePreview: #"""
          Circle()
              .offset(x: isAnimating ? 150 : -150)
              .animation(
                  .spring(
                      response: 0.3,
                      dampingFraction: 0.2,
                      blendDuration: 1
                  ),
                  value: isAnimating
              )
          """#,
          usageExample: #"""
          struct CollisionBounceView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  HStack {
                      Circle()
                          .fill(.red)
                          .frame(width: 50, height: 50)
                          .offset(x: isAnimating ? 150 : -150)
                          .animation(
                              .spring(
                                  response: 0.3,
                                  dampingFraction: 0.2,
                                  blendDuration: 1
                              ),
                              value: isAnimating
                          )
                  }
                  .onTapGesture {
                      isAnimating.toggle()
                  }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Simulates elastic collision using spring animation with low damping.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Elastic Collision",
                      description: "Uses spring physics to create realistic bounce effects."
                  ),
                  AnimationConcept(
                      title: "Low Damping",
                      description: "Creates more pronounced bouncing for elastic collisions."
                  )
              ],
              tips: [
                  "Adjust damping for different material properties",
                  "Use with gesture interactions for dragging",
                  "Add particle effects on collision",
                  "Consider multiple collision points"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.red)
                  .frame(width: 50, height: 50)
                  .offset(x: isAnimating ? 150 : -150)
          }
      ),

      AnimationExample(
          title: "Pendulum Swing",
          description: "Physics-based pendulum motion",
          category: .physics,
          codePreview: #"""
          Circle()
              .rotationEffect(isAnimating ? .degrees(45) : .degrees(-45))
              .animation(
                  .spring(
                      response: 1.5,
                      dampingFraction: 0.5,
                      blendDuration: 0
                  ).repeatForever(autoreverses: true),
                  value: isAnimating
              )
          """#,
          usageExample: #"""
          struct PendulumView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  VStack {
                      Rectangle()
                          .fill(.gray)
                          .frame(width: 2, height: 100)
                          .overlay(alignment: .bottom) {
                              Circle()
                                  .fill(.purple)
                                  .frame(width: 30, height: 30)
                          }
                          .rotationEffect(isAnimating ? .degrees(45) : .degrees(-45))
                          .animation(
                              .spring(
                                  response: 1.5,
                                  dampingFraction: 0.5,
                                  blendDuration: 0
                              ).repeatForever(autoreverses: true),
                              value: isAnimating
                          )
                  }
                  .onAppear {
                      isAnimating = true
                  }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a realistic pendulum motion using spring physics and rotation.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Pendulum Physics",
                      description: "Uses spring animation to simulate natural pendulum swing."
                  ),
                  AnimationConcept(
                      title: "Continuous Motion",
                      description: "Creates perpetual motion with repeating animation."
                  )
              ],
              tips: [
                  "Adjust response time for different pendulum lengths",
                  "Use damping to simulate air resistance",
                  "Consider adding interactive control",
                  "Add multiple pendulums with different timing"
              ]
          ),
          content: { isAnimating in
              Rectangle()
                  .fill(.gray)
                  .frame(width: 2, height: 100)
                  .overlay(alignment: .bottom) {
                      Circle()
                          .fill(.purple)
                          .frame(width: 30, height: 30)
                  }
                  .rotationEffect(isAnimating ? .degrees(45) : .degrees(-45))
          }
      ),

      AnimationExample(
          title: "Spring Chain",
          description: "Connected spring physics simulation",
          category: .physics,
          codePreview: #"""
          ForEach(0..<3) { index in
              Circle()
                  .offset(y: isAnimating ? 30 : -30)
                  .animation(
                      .spring(
                          response: 0.5,
                          dampingFraction: 0.5
                      )
                      .delay(Double(index) * 0.1),
                      value: isAnimating
                  )
          }
          """#,
          usageExample: #"""
          struct SpringChainView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  HStack(spacing: 10) {
                      ForEach(0..<3) { index in
                          Circle()
                              .fill(.orange)
                              .frame(width: 30, height: 30)
                              .offset(y: isAnimating ? 30 : -30)
                              .animation(
                                  .spring(
                                      response: 0.5,
                                      dampingFraction: 0.5
                                  )
                                  .delay(Double(index) * 0.1),
                                  value: isAnimating
                              )
                      }
                  }
                  .onTapGesture {
                      isAnimating.toggle()
                  }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Simulates connected springs using delayed spring animations.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Delayed Animation",
                      description: "Creates chain reaction effect through timing delays."
                  ),
                  AnimationConcept(
                      title: "Spring Parameters",
                      description: "Controls the connected spring behavior."
                  )
              ],
              tips: [
                  "Adjust delays for different chain speeds",
                  "Use consistent spring parameters for cohesion",
                  "Consider adding connecting lines",
                  "Experiment with different spring strengths"
              ]
          ),
          content: { isAnimating in
              HStack(spacing: 10) {
                  ForEach(0..<3, id: \.self) { index in
                      Circle()
                          .fill(.orange)
                          .frame(width: 20, height: 20)
                          .offset(y: isAnimating ? 30 : -30)
                  }
              }
          }
      )
  ]
}

struct CirclePathModifier: ViewModifier {
    let angle: Double
    
    func body(content: Content) -> some View {
        let radius: CGFloat = 50
        content.offset(
            x: radius * cos(angle * .pi / 180),
            y: radius * sin(angle * .pi / 180)
        )
    }
} 
struct FlipModifier: ViewModifier {
    let angle: Double

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(angle),
                axis: (x: 0, y: 1, z: 0)
            )
            .opacity(angle == 0 ? 1 : 0)
    }
}

struct RotateAndScaleModifier: ViewModifier {
    let rotation: Double
    let scale: Double

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotation))
            .scaleEffect(scale)
    }
}
struct FigureEightModifier: ViewModifier {
    let progress: Double
    let width: CGFloat
    let height: CGFloat

    func body(content: Content) -> some View {
        content.offset(
            x: width * sin(2 * progress * .pi),
            y: height * sin(4 * progress * .pi) / 2
        )
    }
}

struct SpiralModifier: ViewModifier {
    let progress: Double
    let maxRadius: CGFloat

    func body(content: Content) -> some View {
        let angle = progress * 4 * .pi
        let radius = progress * maxRadius
        content.offset(
            x: radius * cos(angle),
            y: radius * sin(angle)
        )
    }
}

struct WaveModifier: ViewModifier {
    let progress: Double
    let amplitude: CGFloat
    let frequency: Double

    func body(content: Content) -> some View {
        content.offset(
            x: 100 * CGFloat(progress),
            y: amplitude * sin(frequency * progress * .pi)
        )
    }
}
