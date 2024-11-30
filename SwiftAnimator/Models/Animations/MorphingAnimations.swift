import SwiftUI

extension AnimationExample {
  static let morphingExamples = [
    circleToSquareExample,
    colorBlendExample,
    pathMorphExample,
    gradientMorphExample
  ]

  private static let circleToSquareExample = AnimationExample(
    title: "Circle to Square",
    description: "Smooth shape morphing animation",
    category: .morph,
    codePreview: """
        RoundedRectangle(cornerRadius: isAnimating ? 0 : 50)
            .animation(.easeInOut(duration: 1), value: isAnimating)
        """,
    usageExample: """
        struct CircleToSquareView: View {
            @State private var isAnimating = false
            
            var body: some View {
                RoundedRectangle(cornerRadius: isAnimating ? 0 : 50)
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }
        }
        """,
    explanation: AnimationExplanation(
      overview: "Demonstrates smooth morphing between circle and square shapes using corner radius animation.",
      keyConcepts: [
        AnimationConcept(
          title: "Corner Radius",
          description: "Animates the corner radius to transform between shapes."
        ),
        AnimationConcept(
          title: "Shape Morphing",
          description: "Uses implicit animation to smoothly transition between shapes."
        )
      ],
      tips: [
        "Use easeInOut for smooth transitions",
        "Consider adding rotation during morphing",
        "Try different intermediate corner radius values",
        "Combine with scale for more dramatic effects"
      ]
    ),
    content: { isAnimating in
      RoundedRectangle(cornerRadius: isAnimating ? 0 : 50)
        .fill(.blue)
        .frame(width: 100, height: 100)
    }
  )

  private static let colorBlendExample = AnimationExample(
    title: "Color Blend",
    description: "Smooth color morphing animation",
    category: .morph,
    codePreview: """
        Circle()
            .fill(isAnimating ? 
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing) :
                LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .animation(.easeInOut(duration: 1), value: isAnimating)
        """,
    usageExample: """
        struct ColorBlendView: View {
            @State private var isAnimating = false
            
            var body: some View {
                Circle()
                    .fill(isAnimating ? 
                        LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing) :
                        LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }
        }
        """,
    explanation: AnimationExplanation(
      overview: "Creates smooth transitions between different color gradients.",
      keyConcepts: [
        AnimationConcept(
          title: "Gradient Animation",
          description: "Animates between different gradient configurations."
        ),
        AnimationConcept(
          title: "Color Interpolation",
          description: "SwiftUI automatically interpolates between colors."
        )
      ],
      tips: [
        "Use contrasting colors for dramatic effects",
        "Consider color accessibility",
        "Try different gradient directions",
        "Experiment with multiple color stops"
      ]
    ),
    content: { isAnimating in
      Circle()
        .fill(isAnimating ?
              LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing) :
                LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .frame(width: 100, height: 100)
    }
  )
  private static let gradientMorphExample = AnimationExample(
      title: "Gradient Morph",
      description: "Animated gradient transformation",
      category: .morph,
      codePreview: """
      RoundedRectangle(cornerRadius: 20)
          .fill(
              LinearGradient(
                  colors: isAnimating ? 
                      [.purple, .blue, .cyan] :
                      [.orange, .red, .pink],
                  startPoint: isAnimating ? .topLeading : .bottomTrailing,
                  endPoint: isAnimating ? .bottomTrailing : .topLeading
              )
          )
          .animation(.easeInOut(duration: 2), value: isAnimating)
      """,
      usageExample: """
      struct GradientMorphView: View {
          @State private var isAnimating = false
          
          var body: some View {
              RoundedRectangle(cornerRadius: 20)
                  .fill(
                      LinearGradient(
                          colors: isAnimating ? 
                              [.purple, .blue, .cyan] :
                              [.orange, .red, .pink],
                          startPoint: isAnimating ? .topLeading : .bottomTrailing,
                          endPoint: isAnimating ? .bottomTrailing : .topLeading
                      )
                  )
                  .frame(width: 200, height: 200)
                  .animation(.easeInOut(duration: 2), value: isAnimating)
                  .onTapGesture {
                      isAnimating.toggle()
                  }
          }
      }
      """,
      explanation: AnimationExplanation(
          overview: "Creates a dynamic color transformation by animating both gradient colors and direction.",
          keyConcepts: [
              AnimationConcept(
                  title: "Gradient Animation",
                  description: "Animates between different gradient configurations including colors and positions."
              ),
              AnimationConcept(
                  title: "Multi-Color Interpolation",
                  description: "Smoothly transitions between multiple colors in the gradient."
              )
          ],
          tips: [
              "Use complementary colors for dramatic effects",
              "Experiment with different gradient directions",
              "Try adding more color stops for complex transitions",
              "Consider combining with shape morphing",
              "Use longer durations for smoother color blending"
          ]
      ),
      content: { isAnimating in
          RoundedRectangle(cornerRadius: 20)
              .fill(
                  LinearGradient(
                      colors: isAnimating ?
                          [.purple, .blue, .cyan] :
                          [.orange, .red, .pink],
                      startPoint: isAnimating ? .topLeading : .bottomTrailing,
                      endPoint: isAnimating ? .bottomTrailing : .topLeading
                  )
              )
              .frame(width: 100, height: 100)
      }
  )
  private static let pathMorphExample = AnimationExample(
    title: "Path Morph",
    description: "Complex shape morphing using paths",
    category: .morph,
    codePreview: """
        Path { path in
            if isAnimating {
                path.move(to: CGPoint(x: 0, y: 50))
                path.addQuadCurve(
                    to: CGPoint(x: 100, y: 50),
                    control: CGPoint(x: 50, y: 0)
                )
            } else {
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 0, y: 100))
                path.closeSubpath()
            }
        }
        .animation(.easeInOut(duration: 1), value: isAnimating)
        """,
    usageExample: """
        struct PathMorphView: View {
            @State private var isAnimating = false
            
            var body: some View {
                Path { path in
                    if isAnimating {
                        path.move(to: CGPoint(x: 0, y: 50))
                        path.addQuadCurve(
                            to: CGPoint(x: 100, y: 50),
                            control: CGPoint(x: 50, y: 0)
                        )
                    } else {
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: 100, y: 0))
                        path.addLine(to: CGPoint(x: 100, y: 100))
                        path.addLine(to: CGPoint(x: 0, y: 100))
                        path.closeSubpath()
                    }
                }
                .fill(.purple)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                .onTapGesture {
                    isAnimating.toggle()
                }
            }
        }
        """,
    explanation: AnimationExplanation(
      overview: "Demonstrates complex shape morphing by animating between different path configurations.",
      keyConcepts: [
        AnimationConcept(
          title: "Path Animation",
          description: "Animates between different path definitions."
        ),
        AnimationConcept(
          title: "Shape Interpolation",
          description: "SwiftUI smoothly interpolates between path shapes."
        )
      ],
      tips: [
        "Keep path point count consistent",
        "Use similar path structures for smooth morphing",
        "Consider adding rotation during morphing",
        "Experiment with different curve types"
      ]
    ),
    content: { isAnimating in
      Path { path in
        if isAnimating {
          path.move(to: CGPoint(x: 0, y: 25))
          path.addQuadCurve(
            to: CGPoint(x: 50, y: 25),
            control: CGPoint(x: 25, y: 0)
          )
        } else {
          path.move(to: CGPoint(x: 0, y: 0))
          path.addLine(to: CGPoint(x: 50, y: 0))
          path.addLine(to: CGPoint(x: 50, y: 50))
          path.addLine(to: CGPoint(x: 0, y: 50))
          path.closeSubpath()
        }
      }
      .fill(.purple)
    }
  )

}
