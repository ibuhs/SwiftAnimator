import SwiftUI

extension AnimationExample {
  static let sequenceExamples = [
    loadingSequenceExample,
    domainEffectExample,
    staggeredFadeExample,
    chainReactionExample
  ]
  private static let chainReactionExample = AnimationExample(
      title: "Chain Reaction",
      description: "Connected animation sequence",
      category: .sequence,
      codePreview: #"""
      HStack(spacing: 20) {
          ForEach(0..<4) { index in
              Circle()
                  .fill(isAnimating ? .blue : .gray)
                  .frame(width: 20, height: 20)
                  .scaleEffect(isAnimating ? 1.5 : 1.0)
                  .overlay {
                      Circle()
                          .stroke(.blue.opacity(0.5), lineWidth: 2)
                          .scaleEffect(isAnimating ? 2 : 1)
                          .opacity(isAnimating ? 0 : 1)
                  }
                  .animation(
                      .spring(response: 0.3, dampingFraction: 0.5)
                      .delay(Double(index) * 0.15),
                      value: isAnimating
                  )
          }
      }
      """#,
      usageExample: #"""
      struct ChainReactionView: View {
          @State private var isAnimating = false
          
          var body: some View {
              HStack(spacing: 20) {
                  ForEach(0..<4) { index in
                      Circle()
                          .fill(isAnimating ? .blue : .gray)
                          .frame(width: 20, height: 20)
                          .scaleEffect(isAnimating ? 1.5 : 1.0)
                          .overlay {
                              Circle()
                                  .stroke(.blue.opacity(0.5), lineWidth: 2)
                                  .scaleEffect(isAnimating ? 2 : 1)
                                  .opacity(isAnimating ? 0 : 1)
                          }
                          .animation(
                              .spring(response: 0.3, dampingFraction: 0.5)
                              .delay(Double(index) * 0.15),
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
          overview: "Creates a chain reaction effect with sequenced color, scale, and ripple animations.",
          keyConcepts: [
              AnimationConcept(
                  title: "Multiple Properties",
                  description: "Animates color, scale, and overlay effects simultaneously."
              ),
              AnimationConcept(
                  title: "Sequential Timing",
                  description: "Uses delays to create a domino-like animation effect."
              ),
              AnimationConcept(
                  title: "Ripple Effect",
                  description: "Adds expanding circles for additional visual feedback."
              )
          ],
          tips: [
              "Adjust spring parameters for different bounce effects",
              "Try different delay intervals for varied timing",
              "Experiment with different overlay animations",
              "Consider adding connecting lines between circles",
              "Use for interactive feedback or progress indicators"
          ]
      ),
      content: { isAnimating in
          HStack(spacing: 20) {
              ForEach(0..<4, id: \.self) { index in
                  Circle()
                      .fill(isAnimating ? .blue : .gray)
                      .frame(width: 20, height: 20)
                      .scaleEffect(isAnimating ? 1.5 : 1.0)
                      .overlay {
                          Circle()
                              .stroke(.blue.opacity(0.5), lineWidth: 2)
                              .scaleEffect(isAnimating ? 2 : 1)
                              .opacity(isAnimating ? 0 : 1)
                      }
                      .animation(
                          .spring(response: 0.3, dampingFraction: 0.5)
                          .delay(Double(index) * 0.15),
                          value: isAnimating
                      )
              }
          }
      }
  )
  private static let loadingSequenceExample = AnimationExample(
    title: "Loading Sequence",
    description: "Multi-step loading animation",
    category: .sequence,
    codePreview: #"""
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(.blue)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isAnimating ? 1.5 : 1.0)
                    .opacity(isAnimating ? 0.5 : 1.0)
                    .animation(
                        .easeInOut(duration: 0.5)
                        .repeatForever()
                        .delay(Double(index) * 0.2),
                        value: isAnimating
                    )
            }
        }
        """#,
    usageExample: #"""
        struct LoadingSequenceView: View {
            @State private var isAnimating = false
            
            var body: some View {
                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(.blue)
                            .frame(width: 20, height: 20)
                            .scaleEffect(isAnimating ? 1.5 : 1.0)
                            .opacity(isAnimating ? 0.5 : 1.0)
                            .animation(
                                .easeInOut(duration: 0.5)
                                .repeatForever()
                                .delay(Double(index) * 0.2),
                                value: isAnimating
                            )
                    }
                }
                .onAppear { isAnimating = true }
            }
        }
        """#,
    explanation: AnimationExplanation(
      overview: "Creates a loading indicator with sequenced animations for each dot.",
      keyConcepts: [
        AnimationConcept(
          title: "Animation Delay",
          description: "Uses delays to create sequential animation timing."
        ),
        AnimationConcept(
          title: "Repeating Sequence",
          description: "Combines multiple repeating animations with offsets."
        )
      ],
      tips: [
        "Adjust delays for different timing effects",
        "Try different animation properties",
        "Consider using different shapes",
        "Add color variations for visual interest"
      ]
    ),
    content: { isAnimating in
      HStack(spacing: 8) {
        ForEach(0..<3, id: \.self) { index in
          Circle()
            .fill(.blue)
            .frame(width: 20, height: 20)
            .scaleEffect(isAnimating ? 1.5 : 1.0)
            .opacity(isAnimating ? 0.5 : 1.0)
        }
      }
    }
  )

  private static let domainEffectExample = AnimationExample(
    title: "Domain Effect",
    description: "Cascading animation sequence",
    category: .sequence,
    codePreview: #"""
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                RoundedRectangle(cornerRadius: 4)
                    .fill(.blue)
                    .frame(width: 8, height: isAnimating ? 40 : 10)
                    .animation(
                        .spring(response: 0.3, dampingFraction: 0.5)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.1),
                        value: isAnimating
                    )
            }
        }
        """#,
    usageExample: #"""
        struct DomainEffectView: View {
            @State private var isAnimating = false
            
            var body: some View {
                HStack(spacing: 4) {
                    ForEach(0..<5) { index in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.blue)
                            .frame(width: 8, height: isAnimating ? 40 : 10)
                            .animation(
                                .spring(response: 0.3, dampingFraction: 0.5)
                                .repeatForever(autoreverses: true)
                                .delay(Double(index) * 0.1),
                                value: isAnimating
                            )
                    }
                }
                .onAppear { isAnimating = true }
            }
        }
        """#,
    explanation: AnimationExplanation(
      overview: "Creates an audio equalizer-like effect with sequenced height animations.",
      keyConcepts: [
        AnimationConcept(
          title: "Spring Animation",
          description: "Uses spring physics for natural motion."
        ),
        AnimationConcept(
          title: "Sequential Timing",
          description: "Creates a wave effect through delayed animations."
        )
      ],
      tips: [
        "Experiment with different spring parameters",
        "Try varying the bar widths and spacing",
        "Add color gradients for visual depth",
        "Consider using different shapes"
      ]
    ),
    content: { isAnimating in
      HStack(spacing: 4) {
        ForEach(0..<5, id: \.self) { index in
          RoundedRectangle(cornerRadius: 4)
            .fill(.blue)
            .frame(width: 8, height: isAnimating ? 40 : 10)
        }
      }
    }
  )

  private static let staggeredFadeExample = AnimationExample(
    title: "Staggered Fade",
    description: "Sequential fade-in animation",
    category: .sequence,
    codePreview: #"""
        VStack {
            ForEach(0..<3) { index in
                Text("Item \(index + 1)")
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : -20)
                    .animation(
                        .easeOut(duration: 0.5)
                        .delay(Double(index) * 0.2),
                        value: isAnimating
                    )
            }
        }
        """#,
    usageExample: #"""
        struct StaggeredFadeView: View {
            @State private var isAnimating = false
            
            var body: some View {
                VStack {
                    ForEach(0..<3) { index in
                        Text("Item \(index + 1)")
                            .opacity(isAnimating ? 1 : 0)
                            .offset(x: isAnimating ? 0 : -20)
                            .animation(
                                .easeOut(duration: 0.5)
                                .delay(Double(index) * 0.2),
                                value: isAnimating
                            )
                    }
                }
                .onAppear { isAnimating = true }
            }
        }
        """#,
    explanation: AnimationExplanation(
      overview: "Creates a staggered appearance effect with combined fade and slide animations.",
      keyConcepts: [
        AnimationConcept(
          title: "Multiple Properties",
          description: "Animates both opacity and position simultaneously."
        ),
        AnimationConcept(
          title: "Staggered Timing",
          description: "Uses delays to create sequential appearance."
        )
      ],
      tips: [
        "Adjust delay timing for different rhythms",
        "Try different entrance directions",
        "Combine with scale for more impact",
        "Consider using for list animations"
      ]
    ),
    content: { isAnimating in
      VStack {
        ForEach(0..<3, id: \.self) { index in
          Text("Item \(index + 1)")
            .opacity(isAnimating ? 1 : 0)
            .offset(x: isAnimating ? 0 : -20)
        }
      }
    }
  )

}
