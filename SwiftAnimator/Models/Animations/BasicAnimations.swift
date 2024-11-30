import SwiftUI

extension AnimationExample {
    private static let scaleAndFadeExample = AnimationExample(
        title: "Scale & Fade",
        description: "Simple scaling and opacity animation",
        category: .basic,
        codePreview: """
        Circle()
            .scaleEffect(isAnimating ? 2 : 1)
            .opacity(isAnimating ? 0.5 : 1)
            .animation(.easeInOut(duration: 1), value: isAnimating)
        """,
        usageExample: """
        struct ScaleAndFadeView: View {
            @State private var isAnimating = false
            
            var body: some View {
                Circle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimating ? 2 : 1)
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }
        }
        """,
        explanation: AnimationExplanation(
            overview: "This animation combines scaling and opacity changes to create a smooth transition effect.",
            keyConcepts: [
                AnimationConcept(
                    title: "ScaleEffect",
                    description: "Applies a scaling transform to the view."
                ),
                AnimationConcept(
                    title: "Opacity",
                    description: "Changes the transparency of the view."
                )
            ],
            tips: [
                "Combine multiple animations for more engaging effects",
                "Use easeInOut for smooth animations",
                "Consider accessibility when using rapid animations",
                "Test different timing values"
            ]
        ),
        content: { isAnimating in
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .scaleEffect(isAnimating ? 2 : 1)
                .opacity(isAnimating ? 0.5 : 1)
        }
    )
    
  private static let rotateAndScaleExample = AnimationExample(
      title: "Rotate & Scale",
      description: "Combine rotation and scaling animations",
      category: .basic,
      codePreview: """
      Rectangle()
          .rotationEffect(.degrees(isAnimating ? 360 : 0))
          .scaleEffect(isAnimating ? 1.5 : 1)
          .animation(.easeInOut(duration: 2), value: isAnimating)
      """,
      usageExample: """
      struct RotateAndScaleView: View {
          @State private var isAnimating = false
          
          var body: some View {
              Rectangle()
                  .fill(.purple)
                  .frame(width: 100, height: 100)
                  .rotationEffect(.degrees(isAnimating ? 360 : 0))
                  .scaleEffect(isAnimating ? 1.5 : 1)
                  .animation(.easeInOut(duration: 2), value: isAnimating)
                  .onTapGesture {
                      isAnimating.toggle()
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "This animation combines rotation and scaling to create an engaging visual effect.",
          keyConcepts: [
              AnimationConcept(
                  title: "RotationEffect",
                  description: "Rotates the view around its center by the specified degrees."
              ),
              AnimationConcept(
                  title: "Combined Animations",
                  description: "Multiple animation modifiers can be combined for complex effects."
              )
          ],
          tips: [
              "Use longer durations for smoother rotations",
              "Consider user experience with continuous animations",
              "Combine with other effects for more visual interest"
          ]
      ),
      content: { isAnimating in
          Rectangle()
              .fill(.purple)
              .frame(width: 50, height: 50)
              .rotationEffect(.degrees(isAnimating ? 360 : 0))
              .scaleEffect(isAnimating ? 1.5 : 1)
      }
  )
  private static let colorMorphExample = AnimationExample(
      title: "Color Morph",
      description: "Smooth color transitions",
      category: .basic,
      codePreview: """
      Circle()
          .foregroundStyle(isAnimating ? .purple : .blue)
          .animation(.easeInOut(duration: 1), value: isAnimating)
      """,
      usageExample: """
      struct ColorMorphView: View {
          @State private var isAnimating = false
          
          var body: some View {
              Circle()
                  .frame(width: 100, height: 100)
                  .foregroundStyle(isAnimating ? .purple : .blue)
                  .animation(.easeInOut(duration: 1), value: isAnimating)
                  .onTapGesture {
                      isAnimating.toggle()
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Demonstrates smooth color transitions using SwiftUI's animation system.",
          keyConcepts: [
              AnimationConcept(
                  title: "Color Animation",
                  description: "SwiftUI can animate between different colors smoothly."
              ),
              AnimationConcept(
                  title: "EaseInOut",
                  description: "Creates a smooth acceleration and deceleration effect."
              )
          ],
          tips: [
              "Choose contrasting colors for better visual effect",
              "Consider color accessibility",
              "Use with other animations for richer effects",
              "Try different color spaces for varied transitions"
          ]
      ),
      content: { isAnimating in
          Circle()
              .frame(width: 50, height: 50)
              .foregroundStyle(isAnimating ? .purple : .blue)
      }
  )

  private static let flipExample = AnimationExample(
      title: "3D Flip",
      description: "3D rotation animation with perspective",
      category: .basic,
      codePreview: """
      Rectangle()
          .rotation3DEffect(
              .degrees(isAnimating ? 360 : 0),
              axis: (x: 0, y: 1, z: 0)
          )
          .animation(.easeInOut(duration: 2), value: isAnimating)
      """,
      usageExample: """
      struct FlipView: View {
          @State private var isAnimating = false
          
          var body: some View {
              Rectangle()
                  .fill(.blue)
                  .frame(width: 100, height: 100)
                  .rotation3DEffect(
                      .degrees(isAnimating ? 360 : 0),
                      axis: (x: 0, y: 1, z: 0)
                  )
                  .animation(.easeInOut(duration: 2), value: isAnimating)
                  .onTapGesture {
                      isAnimating.toggle()
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Creates a 3D flip animation using rotation around the Y axis.",
          keyConcepts: [
              AnimationConcept(
                  title: "3D Rotation",
                  description: "Uses rotation3DEffect to create perspective-based animations."
              ),
              AnimationConcept(
                  title: "Rotation Axis",
                  description: "Specifies which axis (x, y, z) the rotation occurs around."
              )
          ],
          tips: [
              "Use longer durations for smoother 3D rotations",
              "Add shadows for enhanced depth perception",
              "Consider using different rotation axes",
              "Combine with opacity for card flip effects"
          ]
      ),
      content: { isAnimating in
          Rectangle()
              .fill(.blue)
              .frame(width: 50, height: 50)
              .rotation3DEffect(
                  .degrees(isAnimating ? 360 : 0),
                  axis: (x: 0, y: 1, z: 0)
              )
      }
  )

  private static let pulseExample = AnimationExample(
      title: "Pulse Effect",
      description: "Smooth pulsing animation with scale and opacity",
      category: .basic,
      codePreview: """
      Circle()
          .scaleEffect(isAnimating ? 1.5 : 1.0)
          .opacity(isAnimating ? 0.2 : 1.0)
          .animation(
              .easeInOut(duration: 1.0)
              .repeatForever(autoreverses: true),
              value: isAnimating
          )
      """,
      usageExample: """
      struct PulseView: View {
          @State private var isAnimating = false
          
          var body: some View {
              Circle()
                  .fill(.blue)
                  .frame(width: 100, height: 100)
                  .scaleEffect(isAnimating ? 1.5 : 1.0)
                  .opacity(isAnimating ? 0.2 : 1.0)
                  .animation(
                      .easeInOut(duration: 1.0)
                      .repeatForever(autoreverses: true),
                      value: isAnimating
                  )
                  .onAppear {
                      isAnimating = true
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Creates a pulsing effect by combining scale and opacity animations in a repeating pattern.",
          keyConcepts: [
              AnimationConcept(
                  title: "Repeating Animation",
                  description: "Uses repeatForever to create continuous pulsing."
              ),
              AnimationConcept(
                  title: "Combined Effects",
                  description: "Merges scale and opacity for a more engaging effect."
              )
          ],
          tips: [
              "Adjust scale range for different pulse intensities",
              "Modify opacity range for varied visual impact",
              "Consider using multiple layers for complex effects",
              "Great for drawing attention to UI elements"
          ]
      ),
      content: { isAnimating in
          Circle()
              .fill(.blue)
              .frame(width: 50, height: 50)
              .scaleEffect(isAnimating ? 1.5 : 1.0)
              .opacity(isAnimating ? 0.2 : 1.0)
      }
  )
  private static let waveMotionExample = AnimationExample(
      title: "Wave Motion",
      description: "Continuous wave-like animation",
      category: .basic,
      codePreview: """
      HStack(spacing: 10) {
          ForEach(0..<3) { index in
              Circle()
                  .offset(y: isAnimating ? 10 : -10)
                  .animation(
                      .easeInOut(duration: 1)
                      .repeatForever(autoreverses: true)
                      .delay(Double(index) * 0.2),
                      value: isAnimating
                  )
          }
      }
      """,
      usageExample: """
      struct WaveMotionView: View {
          @State private var isAnimating = false
          
          var body: some View {
              HStack(spacing: 10) {
                  ForEach(0..<3) { index in
                      Circle()
                          .fill(.blue)
                          .frame(width: 20, height: 20)
                          .offset(y: isAnimating ? 10 : -10)
                          .animation(
                              .easeInOut(duration: 1)
                              .repeatForever(autoreverses: true)
                              .delay(Double(index) * 0.2),
                              value: isAnimating
                          )
                  }
              }
              .onAppear {
                  isAnimating = true
              }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Creates a smooth, continuous wave motion using multiple elements with staggered animations.",
          keyConcepts: [
              AnimationConcept(
                  title: "Delayed Animations",
                  description: "Uses animation delays to create a wave-like sequence effect."
              ),
              AnimationConcept(
                  title: "Repeating Motion",
                  description: "Combines repeatForever with autoreverses for continuous motion."
              )
          ],
          tips: [
              "Adjust delay timings to change wave speed",
              "Modify the offset range for different wave heights",
              "Try different easing curves for varied motion",
              "Great for loading indicators or ambient animations"
          ]
      ),
      content: { isAnimating in
          HStack(spacing: 10) {
              ForEach(0..<3, id: \.self) { index in
                  Circle()
                      .fill(.blue)
                      .frame(width: 15, height: 15)
                      .offset(y: isAnimating ? 10 : -10)
                      .animation(
                          .easeInOut(duration: 1)
                          .repeatForever(autoreverses: true)
                          .delay(Double(index) * 0.2),
                          value: isAnimating
                      )
              }
          }
      }
  )
  private static let shakeExample = AnimationExample(
      title: "Shake Effect",
      description: "Quick shaking animation for error states or alerts",
      category: .basic,
      codePreview: """
      Rectangle()
          .offset(x: isAnimating ? -5 : 5)
          .animation(
              .easeInOut(duration: 0.1)
              .repeatCount(3, autoreverses: true),
              value: isAnimating
          )
      """,
      usageExample: """
      struct ShakeView: View {
          @State private var isAnimating = false
          
          var body: some View {
              Rectangle()
                  .fill(.red)
                  .frame(width: 100, height: 100)
                  .offset(x: isAnimating ? -5 : 5)
                  .animation(
                      .easeInOut(duration: 0.1)
                      .repeatCount(3, autoreverses: true),
                      value: isAnimating
                  )
                  .onTapGesture {
                      isAnimating.toggle()
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Creates a quick shaking animation commonly used to indicate errors or invalid input.",
          keyConcepts: [
              AnimationConcept(
                  title: "Repeat Count",
                  description: "Controls how many times the shake animation repeats."
              ),
              AnimationConcept(
                  title: "Quick Duration",
                  description: "Uses short duration for snappy, attention-grabbing motion."
              )
          ],
          tips: [
              "Keep shake distance small for subtle effect",
              "Use with haptic feedback for better impact",
              "Great for form validation feedback",
              "Consider accessibility - some users may be sensitive to motion"
          ]
      ),
      content: { isAnimating in
          Rectangle()
              .fill(.red)
              .frame(width: 50, height: 50)
              .offset(x: isAnimating ? -5 : 5)
      }
  )

  private static let morphingShapeExample = AnimationExample(
      title: "Morphing Shape",
      description: "Smooth shape transformation animation",
      category: .basic,
      codePreview: """
      RoundedRectangle(cornerRadius: isAnimating ? 40 : 0)
          .animation(.easeInOut(duration: 1), value: isAnimating)
      """,
      usageExample: """
      struct MorphingShapeView: View {
          @State private var isAnimating = false
          
          var body: some View {
              RoundedRectangle(cornerRadius: isAnimating ? 40 : 0)
                  .fill(.purple)
                  .frame(width: 100, height: 100)
                  .animation(.easeInOut(duration: 1), value: isAnimating)
                  .onTapGesture {
                      isAnimating.toggle()
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Demonstrates smooth transitions between different shape configurations using animated corner radius.",
          keyConcepts: [
              AnimationConcept(
                  title: "Shape Morphing",
                  description: "Animates shape properties like corner radius for smooth transformations."
              ),
              AnimationConcept(
                  title: "Implicit Animation",
                  description: "SwiftUI automatically interpolates between shape states."
              )
          ],
          tips: [
              "Try different corner radius values for varied effects",
              "Combine with rotation or scale for more complex morphing",
              "Consider using different shapes as targets",
              "Great for interactive UI elements and transitions"
          ]
      ),
      content: { isAnimating in
          RoundedRectangle(cornerRadius: isAnimating ? 40 : 0)
              .fill(.purple)
              .frame(width: 50, height: 50)
      }
  )



    
    static let basicExamples = [
        scaleAndFadeExample,
        rotateAndScaleExample,
        colorMorphExample,
        flipExample,
        pulseExample,
        shakeExample,
        morphingShapeExample,
        waveMotionExample
    ]
}


