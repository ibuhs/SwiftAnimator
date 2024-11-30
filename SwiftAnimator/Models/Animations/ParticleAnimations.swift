import SwiftUI

extension AnimationExample {
  static let particleExamples = [
    confettiExample,
    sparkleExample,
    fireworksExample,
    rainExample,
    bubbleExample,
    starfieldExample
  ]

  private static let bubbleExample = AnimationExample(
      title: "Rising Bubbles",
      description: "Floating bubble particle animation",
      category: .particle,
      codePreview: #"""
      ForEach(0..<15) { index in
          Circle()
              .fill(.blue.opacity(0.3))
              .frame(width: CGFloat.random(in: 10...30))
              .offset(
                  x: CGFloat.random(in: -50...50),
                  y: isAnimating ? -200 : 50
              )
              .animation(
                  .easeInOut(duration: Double.random(in: 2...4))
                  .repeatForever(autoreverses: false)
                  .delay(Double.random(in: 0...2)),
                  value: isAnimating
              )
      }
      """#,
      usageExample: #"""
      struct BubblesView: View {
          @State private var isAnimating = false
          
          var body: some View {
              ZStack {
                  ForEach(0..<15, id: \.self) { index in
                      Circle()
                          .fill(.blue.opacity(0.3))
                          .frame(width: CGFloat.random(in: 10...30))
                          .offset(
                              x: CGFloat.random(in: -50...50),
                              y: isAnimating ? -200 : 50
                          )
                          .animation(
                              .easeInOut(duration: Double.random(in: 2...4))
                              .repeatForever(autoreverses: false)
                              .delay(Double.random(in: 0...2)),
                              value: isAnimating
                          )
                  }
              }
              .onAppear { isAnimating = true }
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates a soothing effect of bubbles floating upward with varying sizes and speeds.",
          keyConcepts: [
              AnimationConcept(
                  title: "Random Variations",
                  description: "Uses random values for size, position, and timing for natural look."
              ),
              AnimationConcept(
                  title: "Continuous Flow",
                  description: "Creates endless animation with non-reversing repeat."
              )
          ],
          tips: [
              "Adjust bubble count and size range",
              "Use different opacities for depth effect",
              "Try different movement patterns",
              "Consider adding slight horizontal drift"
          ]
      ),
      content: { isAnimating in
          ZStack {
              ForEach(0..<15, id: \.self) { index in
                  Circle()
                      .fill(.blue.opacity(0.3))
                      .frame(width: CGFloat.random(in: 10...30))
                      .offset(
                          x: CGFloat.random(in: -50...50),
                          y: isAnimating ? -200 : 50
                      )
              }
          }
      }
  )

  private static let starfieldExample = AnimationExample(
      title: "Starfield",
      description: "Flying through space effect",
      category: .particle,
      codePreview: #"""
      ForEach(0..<50) { index in
          Circle()
              .fill(.white)
              .frame(width: 2, height: 2)
              .scaleEffect(isAnimating ? 3 : 0.1)
              .offset(
                  x: CGFloat.random(in: -100...100),
                  y: CGFloat.random(in: -100...100)
              )
              .opacity(isAnimating ? 0 : 1)
              .animation(
                  .linear(duration: Double.random(in: 0.5...2))
                  .repeatForever(autoreverses: false),
                  value: isAnimating
              )
      }
      """#,
      usageExample: #"""
      struct StarfieldView: View {
          @State private var isAnimating = false
          
          var body: some View {
              ZStack {
                  Color.black
                  
                  ForEach(0..<50, id: \.self) { index in
                      Circle()
                          .fill(.white)
                          .frame(width: 2, height: 2)
                          .scaleEffect(isAnimating ? 3 : 0.1)
                          .offset(
                              x: CGFloat.random(in: -100...100),
                              y: CGFloat.random(in: -100...100)
                          )
                          .opacity(isAnimating ? 0 : 1)
                          .animation(
                              .linear(duration: Double.random(in: 0.5...2))
                              .repeatForever(autoreverses: false),
                              value: isAnimating
                          )
                  }
              }
              .onAppear { isAnimating = true }
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates a hypnotic starfield effect simulating movement through space.",
          keyConcepts: [
              AnimationConcept(
                  title: "Scale and Fade",
                  description: "Combines scaling and opacity for depth effect."
              ),
              AnimationConcept(
                  title: "Random Timing",
                  description: "Uses varied animation speeds for more realistic effect."
              )
          ],
          tips: [
              "Adjust star count for different densities",
              "Vary star sizes for added depth",
              "Consider adding color variations",
              "Try different movement patterns"
          ]
      ),
      content: { isAnimating in
          ZStack {
              Color.black

              ForEach(0..<50, id: \.self) { index in
                  Circle()
                      .fill(.white)
                      .frame(width: 2, height: 2)
                      .scaleEffect(isAnimating ? 3 : 0.1)
                      .offset(
                          x: CGFloat.random(in: -100...100),
                          y: CGFloat.random(in: -100...100)
                      )
                      .opacity(isAnimating ? 0 : 1)
              }
          }
      }
  )
  private static let rainExample = AnimationExample(
      title: "Rain Effect",
      description: "Falling particle animation",
      category: .particle,
      codePreview: #"""
      ForEach(0..<20) { index in
          Circle()
              .fill(.blue.opacity(0.5))
              .frame(width: 4, height: 12)
              .offset(
                  x: CGFloat.random(in: -50...50),
                  y: isAnimating ? 200 : -50
              )
              .animation(
                  .linear(duration: 1)
                  .repeatForever(autoreverses: false)
                  .delay(Double.random(in: 0...1)),
                  value: isAnimating
              )
      }
      """#,
      usageExample: #"""
      struct RainView: View {
          @State private var isAnimating = false
          
          var body: some View {
              ZStack {
                  // Background for better visibility
                  Color.black.opacity(0.1)
                  
                  ForEach(0..<20, id: \.self) { index in
                      Circle()
                          .fill(.blue.opacity(0.5))
                          .frame(width: 4, height: 12)
                          .offset(
                              x: CGFloat.random(in: -50...50),
                              y: isAnimating ? 200 : -50
                          )
                          .animation(
                              .linear(duration: 1)
                              .repeatForever(autoreverses: false)
                              .delay(Double.random(in: 0...1)),
                              value: isAnimating
                          )
                  }
              }
              .onAppear { isAnimating = true }
              .clipShape(RoundedRectangle(cornerRadius: 20))
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates a realistic rain effect with particles falling from top to bottom with random delays and positions.",
          keyConcepts: [
              AnimationConcept(
                  title: "Random Distribution",
                  description: "Uses random positions and delays for natural appearance."
              ),
              AnimationConcept(
                  title: "Continuous Motion",
                  description: "Applies non-reversing repeating animations for endless rain effect."
              )
          ],
          tips: [
              "Adjust drop size and speed for different rain intensities",
              "Use opacity for depth perception",
              "Add random delays for more natural effect",
              "Consider adding splash effects at the bottom",
              "Try adding slight horizontal movement for wind effect"
          ]
      ),
      content: { isAnimating in
          ZStack {
              // Background for better visibility
              Color.black.opacity(0.1)

              ForEach(0..<20, id: \.self) { index in
                  Circle()
                      .fill(.blue.opacity(0.5))
                      .frame(width: 4, height: 12)
                      .offset(
                          x: CGFloat.random(in: -50...50),
                          y: isAnimating ? 200 : -50
                      )
                      .animation(
                          .linear(duration: 1)
                          .repeatForever(autoreverses: false)
                          .delay(Double.random(in: 0...1)),
                          value: isAnimating
                      )
              }
          }
          .clipShape(RoundedRectangle(cornerRadius: 20))
      }
  )
  private static let confettiExample = AnimationExample(
    title: "Confetti Burst",
    description: "Colorful confetti explosion animation",
    category: .particle,
    codePreview: #"""
        ForEach(0..<20) { index in
            Circle()
                .fill(colors.randomElement()!)
                .frame(width: 10, height: 10)
                .offset(
                    x: isAnimating ? randomOffset() : 0,
                    y: isAnimating ? randomOffset() : 0
                )
                .opacity(isAnimating ? 0 : 1)
                .animation(
                    .easeOut(duration: 1)
                    .delay(Double(index) * 0.02),
                    value: isAnimating
                )
        }
        """#,
    usageExample: #"""
        struct ConfettiView: View {
            @State private var isAnimating = false
            let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange]
            
            func randomOffset() -> CGFloat {
                CGFloat.random(in: -100...100)
            }
            
            var body: some View {
                ZStack {
                    ForEach(0..<20, id: \.self) { index in
                        Circle()
                            .fill(colors.randomElement()!)
                            .frame(width: 10, height: 10)
                            .offset(
                                x: isAnimating ? randomOffset() : 0,
                                y: isAnimating ? randomOffset() : 0
                            )
                            .opacity(isAnimating ? 0 : 1)
                            .animation(
                                .easeOut(duration: 1)
                                .delay(Double(index) * 0.02),
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
      overview: "Creates a burst of colorful particles that explode outward and fade away.",
      keyConcepts: [
        AnimationConcept(
          title: "Multiple Particles",
          description: "Uses multiple views with different delays and random positions."
        ),
        AnimationConcept(
          title: "Random Motion",
          description: "Applies random offsets to create natural-looking dispersion."
        )
      ],
      tips: [
        "Adjust particle count for different densities",
        "Use different shapes for varied effects",
        "Consider adding rotation to particles",
        "Experiment with different color combinations"
      ]
    ),
    content: { isAnimating in
      let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange]

      ZStack {
        ForEach(0..<20, id: \.self) { index in
          Circle()
            .fill(colors.randomElement()!)
            .frame(width: 10, height: 10)
            .offset(
              x: isAnimating ? CGFloat.random(in: -50...50) : 0,
              y: isAnimating ? CGFloat.random(in: -50...50) : 0
            )
            .opacity(isAnimating ? 0 : 1)
        }
      }
    }
  )

  private static let sparkleExample = AnimationExample(
    title: "Sparkle Effect",
    description: "Twinkling star-like particles",
    category: .particle,
    codePreview: #"""
        ForEach(0..<10) { index in
            Image(systemName: "sparkle")
                .foregroundStyle(.yellow)
                .scaleEffect(isAnimating ? 1.5 : 0.5)
                .opacity(isAnimating ? 0 : 1)
                .offset(
                    x: cos(Double(index) * .pi * 0.2) * 30,
                    y: sin(Double(index) * .pi * 0.2) * 30
                )
                .animation(
                    .easeInOut(duration: 0.5)
                    .repeatForever()
                    .delay(Double(index) * 0.1),
                    value: isAnimating
                )
        }
        """#,
    usageExample: #"""
        struct SparkleView: View {
            @State private var isAnimating = false
            
            var body: some View {
                ZStack {
                    ForEach(0..<10, id: \.self) { index in
                        Image(systemName: "sparkle")
                            .foregroundStyle(.yellow)
                            .scaleEffect(isAnimating ? 1.5 : 0.5)
                            .opacity(isAnimating ? 0 : 1)
                            .offset(
                                x: cos(Double(index) * .pi * 0.2) * 30,
                                y: sin(Double(index) * .pi * 0.2) * 30
                            )
                            .animation(
                                .easeInOut(duration: 0.5)
                                .repeatForever()
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
      overview: "Creates a twinkling effect with particles arranged in a circular pattern.",
      keyConcepts: [
        AnimationConcept(
          title: "Circular Arrangement",
          description: "Uses trigonometry to position particles in a circle."
        ),
        AnimationConcept(
          title: "Staggered Animation",
          description: "Applies delays to create a sequential twinkling effect."
        )
      ],
      tips: [
        "Adjust particle count and radius",
        "Try different shapes or SF Symbols",
        "Experiment with color and opacity",
        "Consider adding rotation to the entire pattern"
      ]
    ),
    content: { isAnimating in
      ZStack {
        ForEach(0..<10, id: \.self) { index in
          Image(systemName: "sparkle")
            .foregroundStyle(.yellow)
            .scaleEffect(isAnimating ? 1.5 : 0.5)
            .opacity(isAnimating ? 0 : 1)
            .offset(
              x: cos(Double(index) * .pi * 0.2) * 30,
              y: sin(Double(index) * .pi * 0.2) * 30
            )
        }
      }
    }
  )

  private static let fireworksExample = AnimationExample(
    title: "Fireworks",
    description: "Explosive particle animation",
    category: .particle,
    codePreview: #"""
        ForEach(0..<30) { index in
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 6, height: 6)
                .offset(
                    x: isAnimating ? cos(Double(index) * .pi / 15) * 100 : 0,
                    y: isAnimating ? sin(Double(index) * .pi / 15) * 100 : 0
                )
                .opacity(isAnimating ? 0 : 1)
                .animation(
                    .easeOut(duration: 1)
                    .delay(0.1),
                    value: isAnimating
                )
        }
        """#,
    usageExample: #"""
        struct FireworksView: View {
            @State private var isAnimating = false
            
            var body: some View {
                ZStack {
                    ForEach(0..<30, id: \.self) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 6, height: 6)
                            .offset(
                                x: isAnimating ? cos(Double(index) * .pi / 15) * 100 : 0,
                                y: isAnimating ? sin(Double(index) * .pi / 15) * 100 : 0
                            )
                            .opacity(isAnimating ? 0 : 1)
                            .animation(
                                .easeOut(duration: 1)
                                .delay(0.1),
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
      overview: "Creates a firework-like explosion effect with particles radiating outward.",
      keyConcepts: [
        AnimationConcept(
          title: "Radial Pattern",
          description: "Uses trigonometry to create an even radial distribution."
        ),
        AnimationConcept(
          title: "Gradient Particles",
          description: "Applies gradients to particles for more visual interest."
        )
      ],
      tips: [
        "Adjust particle count for different densities",
        "Try different particle shapes and sizes",
        "Experiment with different gradients",
        "Add multiple layers with different timings"
      ]
    ),
    content: { isAnimating in
      ZStack {
        ForEach(0..<30, id: \.self) { index in
          Circle()
            .fill(
              LinearGradient(
                colors: [.blue, .purple],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 6, height: 6)
            .offset(
              x: isAnimating ? cos(Double(index) * .pi / 15) * 50 : 0,
              y: isAnimating ? sin(Double(index) * .pi / 15) * 50 : 0
            )
            .opacity(isAnimating ? 0 : 1)
        }
      }
    }
  )

}
