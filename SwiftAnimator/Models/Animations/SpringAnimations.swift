import SwiftUI

extension AnimationExample {
  static let springExamples: [AnimationExample] = [
      AnimationExample(
          title: "Bouncy Scale",
          description: "Spring animation with bounce effect",
          category: .spring,
          codePreview: """
          Circle()
              .scaleEffect(isAnimating ? 1.5 : 1)
              .animation(.spring(
                  response: 0.5,
                  dampingFraction: 0.3,
                  blendDuration: 1
              ), value: isAnimating)
          """,
          usageExample: """
          struct BouncyScaleView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.orange)
                      .frame(width: 100, height: 100)
                      .scaleEffect(isAnimating ? 1.5 : 1)
                      .animation(.spring(
                          response: 0.5,
                          dampingFraction: 0.3,
                          blendDuration: 1
                      ), value: isAnimating)
                      .onTapGesture {
                          isAnimating.toggle()
                      }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Spring animations add natural-feeling bounce effects to your animations. They're great for creating more organic and playful interactions.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Response",
                      description: "Controls how quickly the spring responds to changes. Lower values mean faster response."
                  ),
                  AnimationConcept(
                      title: "Damping Fraction",
                      description: "Controls the bounce effect. Lower values create more bounce, higher values create less bounce."
                  ),
                  AnimationConcept(
                      title: "Blend Duration",
                      description: "Controls how smoothly the spring animation blends with other animations."
                  )
              ],
              tips: [
                  "Use lower damping values (0.3-0.5) for playful bounces",
                  "Higher damping values (0.7-1.0) create more subtle effects",
                  "Adjust response time based on the size of the animation",
                  "Consider combining spring animations with other effects"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.orange)
                  .frame(width: 50, height: 50)
                  .scaleEffect(isAnimating ? 1.5 : 1)
          }
      ),
      AnimationExample(
          title: "Spring Movement",
          description: "Position animation with spring physics",
          category: .spring,
          codePreview: """
          Circle()
              .offset(y: isAnimating ? 100 : -100)
              .animation(.spring(
                  response: 0.8,
                  dampingFraction: 0.5
              ), value: isAnimating)
          """,
          usageExample: """
          struct SpringMovementView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.pink)
                      .frame(width: 100, height: 100)
                      .offset(y: isAnimating ? 100 : -100)
                      .animation(.spring(
                          response: 0.8,
                          dampingFraction: 0.5
                      ), value: isAnimating)
                      .onTapGesture {
                          isAnimating.toggle()
                      }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "This example demonstrates how spring animations can make position changes feel more dynamic and natural, similar to real-world physics.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Offset Modifier",
                      description: "Moves the view from its original position without affecting layout."
                  ),
                  AnimationConcept(
                      title: "Spring Animation",
                      description: "Applies spring physics to create natural movement with bounce effects."
                  ),
                  AnimationConcept(
                      title: "Animation Value",
                      description: "Triggers the animation when the specified value changes."
                  )
              ],
              tips: [
                  "Use offset for temporary position changes",
                  "Combine with other spring animations for complex effects",
                  "Adjust spring parameters based on movement distance",
                  "Consider adding gesture interactions for user control"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.pink)
                  .frame(width: 50, height: 50)
                  .offset(y: isAnimating ? 100 : -100)
          }
      ),
      AnimationExample(
          title: "Bouncy Rotation",
          description: "Spring-based rotation animation",
          category: .spring,
          codePreview: """
          Rectangle()
              .rotationEffect(.degrees(isAnimating ? 180 : 0))
              .animation(.spring(
                  response: 0.6,
                  dampingFraction: 0.4,
                  blendDuration: 0.8
              ), value: isAnimating)
          """,
          usageExample: """
          struct BouncyRotationView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Rectangle()
                      .fill(.purple)
                      .frame(width: 100, height: 100)
                      .rotationEffect(.degrees(isAnimating ? 180 : 0))
                      .animation(.spring(
                          response: 0.6,
                          dampingFraction: 0.4,
                          blendDuration: 0.8
                      ), value: isAnimating)
                      .onTapGesture {
                          isAnimating.toggle()
                      }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Demonstrates how spring animations can make rotations feel more dynamic and playful.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Spring Rotation",
                      description: "Applies spring physics to rotation for a bouncy spinning effect."
                  ),
                  AnimationConcept(
                      title: "Response Time",
                      description: "Controls how quickly the rotation reacts to changes."
                  )
              ],
              tips: [
                  "Adjust dampingFraction for more or less bounce",
                  "Use with gestures for interactive rotations",
                  "Combine with scale for more dramatic effects",
                  "Consider using smaller rotation angles for UI feedback"
              ]
          ),
          content: { isAnimating in
              Rectangle()
                  .fill(.purple)
                  .frame(width: 50, height: 50)
                  .rotationEffect(.degrees(isAnimating ? 180 : 0))
          }
      ),
      AnimationExample(
          title: "Spring Chain",
          description: "Connected spring animations with delay",
          category: .spring,
          codePreview: """
          HStack(spacing: 8) {
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
          }
          """,
          usageExample: """
          struct SpringChainView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  HStack(spacing: 8) {
                      ForEach(0..<3) { index in
                          Circle()
                              .fill(.blue)
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
          """,
          explanation: AnimationExplanation(
              overview: "Creates a chain reaction effect using delayed spring animations on multiple elements.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Animation Delay",
                      description: "Staggers the start time of each element's animation."
                  ),
                  AnimationConcept(
                      title: "Chain Effect",
                      description: "Creates a domino-like effect through sequential animations."
                  )
              ],
              tips: [
                  "Adjust delay timing for different chain speeds",
                  "Use with different spring parameters for variety",
                  "Consider adding scale or rotation to the chain",
                  "Great for loading indicators or success animations"
              ]
          ),
          content: { isAnimating in
              HStack(spacing: 8) {
                  ForEach(0..<3, id: \.self) { index in
                      Circle()
                          .fill(.blue)
                          .frame(width: 20, height: 20)
                          .offset(y: isAnimating ? 30 : -30)
                  }
              }
          }
      ),
      AnimationExample(
          title: "Elastic Snap",
          description: "Highly bouncy spring animation",
          category: .spring,
          codePreview: """
          Circle()
              .offset(x: isAnimating ? 100 : -100)
              .animation(
                  .spring(
                      response: 0.7,
                      dampingFraction: 0.3,
                      blendDuration: 1
                  ),
                  value: isAnimating
              )
          """,
          usageExample: """
          struct ElasticSnapView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.orange)
                      .frame(width: 50, height: 50)
                      .offset(x: isAnimating ? 100 : -100)
                      .animation(
                          .spring(
                              response: 0.7,
                              dampingFraction: 0.3,
                              blendDuration: 1
                          ),
                          value: isAnimating
                      )
                      .onTapGesture {
                          isAnimating.toggle()
                      }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Demonstrates an elastic snapping effect using spring animation with low damping.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Low Damping",
                      description: "Creates more pronounced bouncing effect."
                  ),
                  AnimationConcept(
                      title: "Position Animation",
                      description: "Applies spring physics to position changes."
                  )
              ],
              tips: [
                  "Use for emphasis in UI interactions",
                  "Combine with scale for more impact",
                  "Consider reducing bounce for subtle feedback",
                  "Great for snapping elements into place"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.orange)
                  .frame(width: 40, height: 40)
                  .offset(x: isAnimating ? 100 : -100)
          }
      )
  ]
}
