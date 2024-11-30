import SwiftUI

extension AnimationExample {
  static let transitionExamples: [AnimationExample] = [
      AnimationExample(
          title: "Slide Transition",
          description: "Smooth sliding transitions",
          category: .transition,
          codePreview: """
          if isShowing {
              Rectangle()
                  .transition(.slide)
                  .animation(.easeInOut, value: isShowing)
          }
          """,
          usageExample: """
          struct SlideTransitionView: View {
              @State private var isShowing = false
              
              var body: some View {
                  VStack {
                      if isShowing {
                          Rectangle()
                              .fill(.blue)
                              .frame(height: 100)
                              .transition(.slide)
                      }
                      
                      Button("Toggle") {
                          withAnimation {
                              isShowing.toggle()
                          }
                      }
                  }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Shows how to use slide transitions to smoothly introduce and remove views.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Transitions",
                      description: "Animations that occur when views are added or removed."
                  ),
                  AnimationConcept(
                      title: "Slide Effect",
                      description: "Moves the view in from the leading edge and out to the trailing edge."
                  )
              ],
              tips: [
                  "Use withAnimation for transition animations",
                  "Combine transitions for unique effects",
                  "Consider direction of movement"
              ]
          ),
          content: { isAnimating in
              if isAnimating {
                  Rectangle()
                      .fill(.blue)
                      .frame(width: 50, height: 50)
                      .transition(.slide)
              }
          }
      ),
      AnimationExample(
          title: "Scale Transition",
          description: "Smooth scale in/out transition",
          category: .transition,
          codePreview: """
          if isShowing {
              Circle()
                  .transition(.scale(scale: 0.1, anchor: .center))
                  .animation(.easeInOut, value: isShowing)
          }
          """,
          usageExample: """
          struct ScaleTransitionView: View {
              @State private var isShowing = false
              
              var body: some View {
                  VStack {
                      if isShowing {
                          Circle()
                              .fill(.purple)
                              .frame(width: 100, height: 100)
                              .transition(.scale(scale: 0.1, anchor: .center))
                      }
                      
                      Button("Toggle") {
                          withAnimation {
                              isShowing.toggle()
                          }
                      }
                  }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Demonstrates a scale transition that makes views appear to grow from a point and shrink away.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Scale Transition",
                      description: "Animates the view's scale from 0 to 1 when appearing, and vice versa when disappearing."
                  ),
                  AnimationConcept(
                      title: "Anchor Point",
                      description: "Determines the center point of the scaling animation."
                  )
              ],
              tips: [
                  "Use different scale values for varied effects",
                  "Combine with opacity for smoother transitions",
                  "Consider using different anchor points",
                  "Great for modal or popup presentations"
              ]
          ),
          content: { isAnimating in
              if isAnimating {
                  Circle()
                      .fill(.purple)
                      .frame(width: 50, height: 50)
                      .transition(.scale(scale: 0.1, anchor: .center))
              }
          }
      ),
      AnimationExample(
          title: "Flip Card",
          description: "3D card flip transition",
          category: .transition,
          codePreview: """
          if isShowing {
              Rectangle()
                  .transition(.asymmetric(
                      insertion: .modifier(
                          active: FlipModifier(angle: -90),
                          identity: FlipModifier(angle: 0)
                      ),
                      removal: .modifier(
                          active: FlipModifier(angle: 90),
                          identity: FlipModifier(angle: 0)
                      )
                  ))
          }
          """,
          usageExample: """
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
          
          struct FlipCardView: View {
              @State private var isShowing = false
              
              var body: some View {
                  VStack {
                      if isShowing {
                          Rectangle()
                              .fill(.purple)
                              .frame(width: 100, height: 150)
                              .transition(.asymmetric(
                                  insertion: .modifier(
                                      active: FlipModifier(angle: -90),
                                      identity: FlipModifier(angle: 0)
                                  ),
                                  removal: .modifier(
                                      active: FlipModifier(angle: 90),
                                      identity: FlipModifier(angle: 0)
                                  )
                              ))
                      }
                      
                      Button("Flip") {
                          withAnimation(.easeInOut(duration: 0.5)) {
                              isShowing.toggle()
                          }
                      }
                  }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Creates a realistic card flip effect using 3D rotation and opacity transitions.",
              keyConcepts: [
                  AnimationConcept(
                      title: "3D Rotation",
                      description: "Uses rotation3DEffect to create the illusion of a flipping card."
                  ),
                  AnimationConcept(
                      title: "Custom ViewModifier",
                      description: "Combines rotation and opacity for a seamless flip effect."
                  )
              ],
              tips: [
                  "Add shadows for more depth",
                  "Consider using different content for front/back",
                  "Adjust rotation axis for different flip directions",
                  "Use with gesture interactions for card games"
              ]
          ),
          content: { isAnimating in
              if isAnimating {
                  Rectangle()
                      .fill(.purple)
                      .frame(width: 50, height: 75)
                      .transition(.asymmetric(
                          insertion: .modifier(
                              active: FlipModifier(angle: -90),
                              identity: FlipModifier(angle: 0)
                          ),
                          removal: .modifier(
                              active: FlipModifier(angle: 90),
                              identity: FlipModifier(angle: 0)
                          )
                      ))
              }
          }
      ),
      AnimationExample(
          title: "Flip Card",
          description: "3D card flip transition",
          category: .transition,
          codePreview: """
          if isShowing {
              Rectangle()
                  .transition(.asymmetric(
                      insertion: .modifier(
                          active: FlipModifier(angle: -90),
                          identity: FlipModifier(angle: 0)
                      ),
                      removal: .modifier(
                          active: FlipModifier(angle: 90),
                          identity: FlipModifier(angle: 0)
                      )
                  ))
          }
          """,
          usageExample: """
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
          
          struct FlipCardView: View {
              @State private var isShowing = false
              
              var body: some View {
                  VStack {
                      if isShowing {
                          Rectangle()
                              .fill(.purple)
                              .frame(width: 100, height: 150)
                              .transition(.asymmetric(
                                  insertion: .modifier(
                                      active: FlipModifier(angle: -90),
                                      identity: FlipModifier(angle: 0)
                                  ),
                                  removal: .modifier(
                                      active: FlipModifier(angle: 90),
                                      identity: FlipModifier(angle: 0)
                                  )
                              ))
                      }
                      
                      Button("Flip") {
                          withAnimation(.easeInOut(duration: 0.5)) {
                              isShowing.toggle()
                          }
                      }
                  }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Creates a realistic card flip effect using 3D rotation and opacity transitions.",
              keyConcepts: [
                  AnimationConcept(
                      title: "3D Rotation",
                      description: "Uses rotation3DEffect to create the illusion of a flipping card."
                  ),
                  AnimationConcept(
                      title: "Custom ViewModifier",
                      description: "Combines rotation and opacity for a seamless flip effect."
                  )
              ],
              tips: [
                  "Add shadows for more depth",
                  "Consider using different content for front/back",
                  "Adjust rotation axis for different flip directions",
                  "Use with gesture interactions for card games"
              ]
          ),
          content: { isAnimating in
              if isAnimating {
                  Rectangle()
                      .fill(.purple)
                      .frame(width: 50, height: 75)
                      .transition(.asymmetric(
                          insertion: .modifier(
                              active: FlipModifier(angle: -90),
                              identity: FlipModifier(angle: 0)
                          ),
                          removal: .modifier(
                              active: FlipModifier(angle: 90),
                              identity: FlipModifier(angle: 0)
                          )
                      ))
              }
          }
      ),
      AnimationExample(
          title: "Move and Fade",
          description: "Combined move and fade transition",
          category: .transition,
          codePreview: """
          if isShowing {
              Rectangle()
                  .transition(
                      .asymmetric(
                          insertion: .move(edge: .leading).combined(with: .opacity),
                          removal: .move(edge: .trailing).combined(with: .opacity)
                      )
                  )
          }
          """,
          usageExample: """
          struct MoveAndFadeView: View {
              @State private var isShowing = false
              
              var body: some View {
                  VStack {
                      if isShowing {
                          Rectangle()
                              .fill(.blue)
                              .frame(height: 100)
                              .transition(
                                  .asymmetric(
                                      insertion: .move(edge: .leading).combined(with: .opacity),
                                      removal: .move(edge: .trailing).combined(with: .opacity)
                                  )
                              )
                      }
                      
                      Button("Toggle") {
                          withAnimation(.easeInOut) {
                              isShowing.toggle()
                          }
                      }
                  }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Shows how to combine multiple transitions and use different animations for insertion and removal.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Combined Transitions",
                      description: "Merges multiple transition effects into one smooth animation."
                  ),
                  AnimationConcept(
                      title: "Asymmetric Transitions",
                      description: "Uses different transitions for appearing and disappearing."
                  )
              ],
              tips: [
                  "Combine different transitions for unique effects",
                  "Use asymmetric transitions for natural interactions",
                  "Consider the direction of movement",
                  "Add easing for smoother transitions"
              ]
          ),
          content: { isAnimating in
              if isAnimating {
                  Rectangle()
                      .fill(.blue)
                      .frame(width: 50, height: 50)
                      .transition(
                          .asymmetric(
                              insertion: .move(edge: .leading).combined(with: .opacity),
                              removal: .move(edge: .trailing).combined(with: .opacity)
                          )
                      )
              }
          }
      ),
      AnimationExample(
          title: "Custom Transition",
          description: "Custom rotation and scale transition",
          category: .transition,
          codePreview: """
          extension AnyTransition {
              static var rotateAndScale: AnyTransition {
                  .modifier(
                      active: RotateAndScaleModifier(rotation: 180, scale: 0),
                      identity: RotateAndScaleModifier(rotation: 0, scale: 1)
                  )
              }
          }
          
          if isShowing {
              Circle()
                  .transition(.rotateAndScale)
          }
          """,
          usageExample: """
          struct RotateAndScaleModifier: ViewModifier {
              let rotation: Double
              let scale: Double
              
              func body(content: Content) -> some View {
                  content
                      .rotationEffect(.degrees(rotation))
                      .scaleEffect(scale)
              }
          }
          
          struct CustomTransitionView: View {
              @State private var isShowing = false
              
              var body: some View {
                  VStack {
                      if isShowing {
                          Circle()
                              .fill(.green)
                              .frame(width: 100, height: 100)
                              .transition(.rotateAndScale)
                      }
                      
                      Button("Toggle") {
                          withAnimation(.easeInOut) {
                              isShowing.toggle()
                          }
                      }
                  }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Demonstrates how to create custom transitions by combining multiple transformations.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Custom ViewModifier",
                      description: "Creates reusable view modifications for transitions."
                  ),
                  AnimationConcept(
                      title: "Combined Transformations",
                      description: "Applies multiple transformations in a single transition."
                  )
              ],
              tips: [
                  "Create reusable transitions for consistency",
                  "Combine different transformations for unique effects",
                  "Consider performance with complex transitions",
                  "Use custom transitions to match your app's style"
              ]
          ),
          content: { isAnimating in
              if isAnimating {
                  Circle()
                      .fill(.green)
                      .frame(width: 50, height: 50)
                      .transition(.asymmetric(
                          insertion: .scale.combined(with: .opacity),
                          removal: .scale.combined(with: .opacity)
                      ))
              }
          }
      )
  ]
}
