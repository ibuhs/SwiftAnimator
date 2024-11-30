import SwiftUI

extension AnimationExample {
    static let advancedExamples = [
        particleSystemExample,
        morphingLoaderExample,
        interactiveWaveExample,
        galaxyExample,liquidLoaderExample,audioVisualizerExample
    ]
  private static let liquidLoaderExample = AnimationExample(
      title: "Liquid Loader",
      description: "Fluid animation with blob effect",
      category: .advanced,
      codePreview: #"""
      TimelineView(.animation) { timeline in
          Canvas { context, size in
              let time = timeline.date.timeIntervalSinceReferenceDate
              let baseRadius: CGFloat = 20
              let center = CGPoint(x: size.width/2, y: size.height/2)
              let points = (0..<8).map { i -> CGPoint in
                  let angle = 2 * .pi * Double(i) / 8
                  let wobble = sin(time * 2 + Double(i)) * 5
                  let x = center.x + cos(angle) * (baseRadius + wobble)
                  let y = center.y + sin(angle) * (baseRadius + wobble)
                  return CGPoint(x: x, y: y)
              }
              
              var path = Path()
              path.addArc(center: center, radius: baseRadius,
                         startAngle: .zero, endAngle: .degrees(360), clockwise: false)
              
              context.blendMode = .plusLighter
              context.addFilter(.blur(radius: 10))
              context.fill(path, with: .linearGradient(
                  Gradient(colors: [.blue, .purple]),
                  startPoint: CGPoint(x: 0, y: 0),
                  endPoint: CGPoint(x: size.width, y: size.height)
              ))
          }
      }
      """#,
      usageExample: #"""
      struct LiquidLoaderView: View {
          var body: some View {
              TimelineView(.animation) { timeline in
                  Canvas { context, size in
                      let time = timeline.date.timeIntervalSinceReferenceDate
                      let baseRadius: CGFloat = 20
                      let center = CGPoint(x: size.width/2, y: size.height/2)
                      let points = (0..<8).map { i -> CGPoint in
                          let angle = 2 * .pi * Double(i) / 8
                          let wobble = sin(time * 2 + Double(i)) * 5
                          let x = center.x + cos(angle) * (baseRadius + wobble)
                          let y = center.y + sin(angle) * (baseRadius + wobble)
                          return CGPoint(x: x, y: y)
                      }
                      
                      var path = Path()
                      path.addArc(center: center, radius: baseRadius,
                                 startAngle: .zero, endAngle: .degrees(360), clockwise: false)
                      
                      context.blendMode = .plusLighter
                      context.addFilter(.blur(radius: 10))
                      context.fill(path, with: .linearGradient(
                          Gradient(colors: [.blue, .purple]),
                          startPoint: CGPoint(x: 0, y: 0),
                          endPoint: CGPoint(x: size.width, y: size.height)
                      ))
                  }
              }
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates a liquid-like loading animation using Canvas and Timeline animations.",
          keyConcepts: [
              AnimationConcept(
                  title: "Canvas Drawing",
                  description: "Uses SwiftUI Canvas for high-performance custom drawing."
              ),
              AnimationConcept(
                  title: "Timeline Animation",
                  description: "Creates continuous animation based on time."
              ),
              AnimationConcept(
                  title: "Blend Modes",
                  description: "Uses blend modes for glow effects."
              )
          ],
          tips: [
              "Adjust blur radius for different glow intensities",
              "Try different blend modes for varied effects",
              "Experiment with different wobble patterns",
              "Consider performance on different devices"
          ]
      ),
      content: { isAnimating in
          TimelineView(.animation) { timeline in
              Canvas { context, size in
                  let time = timeline.date.timeIntervalSinceReferenceDate
                  let baseRadius: CGFloat = 20
                  let center = CGPoint(x: size.width/2, y: size.height/2)

                  var path = Path()
                  path.addArc(center: center, radius: baseRadius,
                             startAngle: .zero, endAngle: .degrees(360), clockwise: false)

                  context.blendMode = .plusLighter
                  context.addFilter(.blur(radius: 10))
                  context.fill(path, with: .linearGradient(
                      Gradient(colors: [.blue, .purple]),
                      startPoint: CGPoint(x: 0, y: 0),
                      endPoint: CGPoint(x: size.width, y: size.height)
                  ))
              }
          }
      }
  )

  private static let audioVisualizerExample = AnimationExample(
      title: "Audio Visualizer",
      description: "Complex audio visualization animation",
      category: .advanced,
      codePreview: #"""
      TimelineView(.animation) { timeline in
          HStack(spacing: 2) {
              ForEach(0..<30) { index in
                  RoundedRectangle(cornerRadius: 2)
                      .fill(
                          LinearGradient(
                              colors: [.blue, .purple],
                              startPoint: .top,
                              endPoint: .bottom
                          )
                      )
                      .frame(width: 4)
                      .frame(height: height(for: index, time: timeline.date.timeIntervalSinceReferenceDate))
                      .animation(.spring(response: 0.5, dampingFraction: 0.5), value: timeline.date)
              }
          }
      }
      
      func height(for index: Int, time: TimeInterval) -> CGFloat {
          let frequency = 2.0 + Double(index) * 0.2
          let amplitude = 30.0 + sin(time + Double(index) * 0.5) * 20.0
          return abs(sin(time * frequency)) * amplitude + 5
      }
      """#,
      usageExample: #"""
      struct AudioVisualizerView: View {
          var body: some View {
              TimelineView(.animation) { timeline in
                  HStack(spacing: 2) {
                      ForEach(0..<30) { index in
                          RoundedRectangle(cornerRadius: 2)
                              .fill(
                                  LinearGradient(
                                      colors: [.blue, .purple],
                                      startPoint: .top,
                                      endPoint: .bottom
                                  )
                              )
                              .frame(width: 4)
                              .frame(height: height(for: index, time: timeline.date.timeIntervalSinceReferenceDate))
                              .animation(.spring(response: 0.5, dampingFraction: 0.5), value: timeline.date)
                      }
                  }
              }
          }
          
          func height(for index: Int, time: TimeInterval) -> CGFloat {
              let frequency = 2.0 + Double(index) * 0.2
              let amplitude = 30.0 + sin(time + Double(index) * 0.5) * 20.0
              return abs(sin(time * frequency)) * amplitude + 5
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates a dynamic audio visualizer effect using mathematical functions and timeline animations.",
          keyConcepts: [
              AnimationConcept(
                  title: "Timeline Animation",
                  description: "Uses continuous time-based animation."
              ),
              AnimationConcept(
                  title: "Mathematical Functions",
                  description: "Combines sine waves for natural-looking motion."
              ),
              AnimationConcept(
                  title: "Dynamic Heights",
                  description: "Calculates bar heights based on time and position."
              )
          ],
          tips: [
              "Adjust frequencies for different visual patterns",
              "Try different color combinations",
              "Experiment with bar widths and spacing",
              "Consider adding touch interaction"
          ]
      ),
      content: { isAnimating in
          TimelineView(.animation) { timeline in
              HStack(spacing: 2) {
                  ForEach(0..<30, id: \.self) { index in
                      RoundedRectangle(cornerRadius: 2)
                          .fill(
                              LinearGradient(
                                  colors: [.blue, .purple],
                                  startPoint: .top,
                                  endPoint: .bottom
                              )
                          )
                          .frame(width: 4)
                          .frame(height: {
                              let time = timeline.date.timeIntervalSinceReferenceDate
                              let frequency = 2.0 + Double(index) * 0.2
                              let amplitude = 30.0 + sin(time + Double(index) * 0.5) * 20.0
                              return abs(sin(time * frequency)) * amplitude + 5
                          }())
                  }
              }
          }
      }
  )
    private static let particleSystemExample = AnimationExample(
        title: "Particle System",
        description: "Complex particle system with physics",
        category: .advanced,
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
                .frame(width: CGFloat.random(in: 4...8))
                .offset(
                    x: isAnimating ? 
                        cos(Double(index) * .pi / 15) * CGFloat.random(in: 50...100) : 0,
                    y: isAnimating ? 
                        sin(Double(index) * .pi / 15) * CGFloat.random(in: 50...100) : 0
                )
                .scaleEffect(isAnimating ? CGFloat.random(in: 0.5...1.5) : 1)
                .opacity(isAnimating ? 0 : 1)
                .blur(radius: isAnimating ? 0.5 : 0)
                .animation(
                    .spring(
                        response: Double.random(in: 0.5...1.0),
                        dampingFraction: 0.7,
                        blendDuration: 1
                    )
                    .repeatForever(autoreverses: false),
                    value: isAnimating
                )
        }
        """#,
        usageExample: #"""
        struct ParticleSystemView: View {
            @State private var isAnimating = false
            
            var body: some View {
                ZStack {
                    // Background
                    Color.black
                    
                    // Particle system
                    ForEach(0..<30, id: \.self) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: CGFloat.random(in: 4...8))
                            .offset(
                                x: isAnimating ? 
                                    cos(Double(index) * .pi / 15) * CGFloat.random(in: 50...100) : 0,
                                y: isAnimating ? 
                                    sin(Double(index) * .pi / 15) * CGFloat.random(in: 50...100) : 0
                            )
                            .scaleEffect(isAnimating ? CGFloat.random(in: 0.5...1.5) : 1)
                            .opacity(isAnimating ? 0 : 1)
                            .blur(radius: isAnimating ? 0.5 : 0)
                            .animation(
                                .spring(
                                    response: Double.random(in: 0.5...1.0),
                                    dampingFraction: 0.7,
                                    blendDuration: 1
                                )
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
            overview: "Creates a complex particle system with physics-based movement, scaling, and opacity changes.",
            keyConcepts: [
                AnimationConcept(
                    title: "Multiple Properties",
                    description: "Animates position, scale, opacity, and blur simultaneously."
                ),
                AnimationConcept(
                    title: "Random Variations",
                    description: "Uses random values for natural, organic movement."
                ),
                AnimationConcept(
                    title: "Spring Physics",
                    description: "Applies spring animations for realistic motion."
                )
            ],
            tips: [
                "Adjust particle count for different densities",
                "Experiment with different gradients and colors",
                "Try different spring parameters for varied motion",
                "Consider adding interaction with touch events",
                "Use blur and opacity for depth effects"
            ]
        ),
        content: { isAnimating in
            ZStack {
                Color.black
                
                ForEach(0..<30, id: \.self) { index in
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: CGFloat.random(in: 4...8))
                        .offset(
                            x: isAnimating ? 
                                cos(Double(index) * .pi / 15) * CGFloat.random(in: 50...100) : 0,
                            y: isAnimating ? 
                                sin(Double(index) * .pi / 15) * CGFloat.random(in: 50...100) : 0
                        )
                        .scaleEffect(isAnimating ? CGFloat.random(in: 0.5...1.5) : 1)
                        .opacity(isAnimating ? 0 : 1)
                        .blur(radius: isAnimating ? 0.5 : 0)
                }
            }
        }
    )
    
    private static let morphingLoaderExample = AnimationExample(
        title: "Morphing Loader",
        description: "Shape-morphing loading animation",
        category: .advanced,
        codePreview: #"""
        Circle()
            .fill(
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: isAnimating ? .topLeading : .bottomTrailing,
                    endPoint: isAnimating ? .bottomTrailing : .topLeading
                )
            )
            .scaleEffect(isAnimating ? 1.2 : 0.8)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .modifier(WaveModifier(amplitude: isAnimating ? 10 : 0))
            .animation(
                .spring(response: 1, dampingFraction: 0.6)
                .repeatForever(autoreverses: true),
                value: isAnimating
            )
        """#,
        usageExample: #"""
        struct WaveModifier: ViewModifier {
            let amplitude: CGFloat
            
            func body(content: Content) -> some View {
                content.modifier(
                    ShapeEffect(
                        function: { point in
                            let offset = sin(point.x / 20) * amplitude
                            return CGPoint(x: point.x, y: point.y + offset)
                        },
                        animatableData: amplitude
                    )
                )
            }
        }
        
        struct MorphingLoaderView: View {
            @State private var isAnimating = false
            
            var body: some View {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: isAnimating ? .topLeading : .bottomTrailing,
                            endPoint: isAnimating ? .bottomTrailing : .topLeading
                        )
                    )
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimating ? 1.2 : 0.8)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .modifier(WaveModifier(amplitude: isAnimating ? 10 : 0))
                    .animation(
                        .spring(response: 1, dampingFraction: 0.6)
                        .repeatForever(autoreverses: true),
                        value: isAnimating
                    )
                    .onAppear { isAnimating = true }
            }
        }
        """#,
        explanation: AnimationExplanation(
            overview: "Creates a complex loading animation that combines shape morphing, rotation, and gradient animations.",
            keyConcepts: [
                AnimationConcept(
                    title: "Shape Distortion",
                    description: "Uses custom modifier to create wave-like distortions."
                ),
                AnimationConcept(
                    title: "Combined Animations",
                    description: "Merges multiple animation types for complex effects."
                )
            ],
            tips: [
                "Adjust wave amplitude for different effects",
                "Try different gradient color combinations",
                "Experiment with spring parameters",
                "Consider adding multiple layers",
                "Use for engaging loading states"
            ]
        ),
        content: { isAnimating in
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: isAnimating ? .topLeading : .bottomTrailing,
                        endPoint: isAnimating ? .bottomTrailing : .topLeading
                    )
                )
                .frame(width: 50, height: 50)
                .scaleEffect(isAnimating ? 1.2 : 0.8)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
        }
    )
  private static let interactiveWaveExample = AnimationExample(
      title: "Interactive Wave",
      description: "Touch-responsive wave animation",
      category: .advanced,
      codePreview: #"""
      GeometryReader { geometry in
          Path { path in
              let width = geometry.size.width
              let height = geometry.size.height
              let midHeight = height / 2
              
              path.move(to: CGPoint(x: 0, y: midHeight))
              
              // Create wave path using sine function
              stride(from: 0, to: width, by: 1).forEach { x in
                  let relativeX = x / width
                  let normalizedX = relativeX * .pi * 2 * frequency
                  let y = sin(normalizedX + phase) * amplitude + midHeight
                  path.addLine(to: CGPoint(x: x, y: y))
              }
              
              path.addLine(to: CGPoint(x: width, y: height))
              path.addLine(to: CGPoint(x: 0, y: height))
              path.closeSubpath()
          }
          .fill(
              LinearGradient(
                  colors: [.blue, .blue.opacity(0.3)],
                  startPoint: .top,
                  endPoint: .bottom
              )
          )
          .animation(.linear(duration: 2), value: phase)
      }
      """#,
      usageExample: #"""
      struct InteractiveWaveView: View {
          @State private var phase: CGFloat = 0
          @State private var amplitude: CGFloat = 20
          @State private var frequency: CGFloat = 1
          @State private var dragOffset: CGFloat = 0
          
          let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
          
          var body: some View {
              GeometryReader { geometry in
                  Path { path in
                      let width = geometry.size.width
                      let height = geometry.size.height
                      let midHeight = height / 2 + dragOffset
                      
                      path.move(to: CGPoint(x: 0, y: midHeight))
                      
                      stride(from: 0, to: width, by: 1).forEach { x in
                          let relativeX = x / width
                          let normalizedX = relativeX * .pi * 2 * frequency
                          let y = sin(normalizedX + phase) * amplitude + midHeight
                          path.addLine(to: CGPoint(x: x, y: y))
                      }
                      
                      path.addLine(to: CGPoint(x: width, y: height))
                      path.addLine(to: CGPoint(x: 0, y: height))
                      path.closeSubpath()
                  }
                  .fill(
                      LinearGradient(
                          colors: [.blue, .blue.opacity(0.3)],
                          startPoint: .top,
                          endPoint: .bottom
                      )
                  )
                  .gesture(
                      DragGesture()
                          .onChanged { value in
                              dragOffset = value.translation.height
                              amplitude = max(10, abs(value.translation.height))
                          }
                          .onEnded { _ in
                              withAnimation(.spring()) {
                                  dragOffset = 0
                                  amplitude = 20
                              }
                          }
                  )
              }
              .onReceive(timer) { _ in
                  phase += 0.05
              }
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates an interactive wave animation that responds to touch input and continuously animates.",
          keyConcepts: [
              AnimationConcept(
                  title: "Path Animation",
                  description: "Uses dynamic path generation for smooth wave motion."
              ),
              AnimationConcept(
                  title: "Gesture Interaction",
                  description: "Responds to drag gestures by modifying wave properties."
              ),
              AnimationConcept(
                  title: "Timer Animation",
                  description: "Uses a timer to create continuous wave motion."
              )
          ],
          tips: [
              "Adjust frequency for different wave patterns",
              "Modify amplitude range for varied wave heights",
              "Try different gradient colors for varied effects",
              "Consider adding multiple waves with different phases",
              "Add haptic feedback for better interaction"
          ]
      ),
      content: { isAnimating in
          TimelineView(.animation) { timeline in
              GeometryReader { geometry in
                  let phase = timeline.date.timeIntervalSinceReferenceDate
                  let frequency: CGFloat = 3
                  let amplitude: CGFloat = 10

                  Path { path in
                      let width = geometry.size.width
                      let height = geometry.size.height
                      let midHeight = height / 2

                      path.move(to: CGPoint(x: 0, y: midHeight))

                      stride(from: 0, to: width, by: 1).forEach { x in
                          let relativeX = x / width
                          let normalizedX = relativeX * .pi * 2 * frequency
                          let y = sin(normalizedX + phase) * amplitude + midHeight
                          path.addLine(to: CGPoint(x: x, y: y))
                      }

                      path.addLine(to: CGPoint(x: width, y: height))
                      path.addLine(to: CGPoint(x: 0, y: height))
                      path.closeSubpath()
                  }
                  .fill(
                      LinearGradient(
                          colors: [.blue, .blue.opacity(0.3)],
                          startPoint: .top,
                          endPoint: .bottom
                      )
                  )
              }
          }
      }
  )
  private static let galaxyExample = AnimationExample(
      title: "Galaxy",
      description: "Complex galaxy simulation with multiple particle systems",
      category: .advanced,
      codePreview: #"""
      ZStack {
          // Background stars
          ForEach(0..<200) { index in
              Circle()
                  .fill(.white.opacity(Double.random(in: 0.1...0.7)))
                  .frame(width: Double.random(in: 1...4))
                  .offset(
                      x: CGFloat.random(in: -300...300),
                      y: CGFloat.random(in: -300...300)
                  )
                  .blur(radius: 0.2)
          }
          
          // Spiral arms
          ForEach(0..<4) { arm in
              ForEach(0..<60) { index in
                  let angle = Double(index) * 0.15 + Double(arm) * .pi / 2
                  let radius = Double(index) * 3
                  let wobble = sin(Double(index) * 0.1) * 15
                  
                  Circle()
                      .fill(
                          LinearGradient(
                              colors: [.blue, .purple],
                              startPoint: .topLeading,
                              endPoint: .bottomTrailing
                          )
                      )
                      .frame(width: Double.random(in: 2...8))
                      .offset(
                          x: cos(angle + (isAnimating ? .pi : 0)) * (radius + wobble),
                          y: sin(angle + (isAnimating ? .pi : 0)) * (radius + wobble)
                      )
                      .opacity(Double.random(in: 0.3...0.9))
                      .blur(radius: 0.3)
              }
          }
          
          // Central core
          ZStack {
              // Core glow
              Circle()
                  .fill(
                      RadialGradient(
                          colors: [.white, .blue.opacity(0.5), .clear],
                          center: .center,
                          startRadius: 5,
                          endRadius: 50
                      )
                  )
                  .frame(width: 100, height: 100)
                  .blur(radius: 10)
              
              // Bright center
              Circle()
                  .fill(.white)
                  .frame(width: 20, height: 20)
                  .blur(radius: 3)
                  .overlay {
                      Circle()
                          .stroke(.white.opacity(0.5), lineWidth: 2)
                          .scaleEffect(isAnimating ? 2 : 1)
                          .opacity(isAnimating ? 0 : 1)
                  }
          }
      }
      .drawingGroup()
      """#,
      usageExample: #"""
      struct GalaxyView: View {
          @State private var isAnimating = false
          
          var body: some View {
              ZStack {
                  Color.black.ignoresSafeArea()
                  
                  ZStack {
                      // Background stars
                      ForEach(0..<200, id: \.self) { index in
                          Circle()
                              .fill(.white.opacity(Double.random(in: 0.1...0.7)))
                              .frame(width: Double.random(in: 1...4))
                              .offset(
                                  x: CGFloat.random(in: -300...300),
                                  y: CGFloat.random(in: -300...300)
                              )
                              .blur(radius: 0.2)
                      }
                      
                      // Spiral arms
                      ForEach(0..<4, id: \.self) { arm in
                          ForEach(0..<60, id: \.self) { index in
                              let angle = Double(index) * 0.15 + Double(arm) * .pi / 2
                              let radius = Double(index) * 3
                              let wobble = sin(Double(index) * 0.1) * 15
                              
                              Circle()
                                  .fill(
                                      LinearGradient(
                                          colors: [.blue, .purple],
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing
                                      )
                                  )
                                  .frame(width: Double.random(in: 2...8))
                                  .offset(
                                      x: cos(angle + (isAnimating ? .pi : 0)) * (radius + wobble),
                                      y: sin(angle + (isAnimating ? .pi : 0)) * (radius + wobble)
                                  )
                                  .opacity(Double.random(in: 0.3...0.9))
                                  .blur(radius: 0.3)
                          }
                      }
                      
                      // Central core with enhanced glow
                      ZStack {
                          Circle()
                              .fill(
                                  RadialGradient(
                                      colors: [.white, .blue.opacity(0.5), .clear],
                                      center: .center,
                                      startRadius: 5,
                                      endRadius: 50
                                  )
                              )
                              .frame(width: 100, height: 100)
                              .blur(radius: 10)
                          
                          Circle()
                              .fill(.white)
                              .frame(width: 20, height: 20)
                              .blur(radius: 3)
                              .overlay {
                                  Circle()
                                      .stroke(.white.opacity(0.5), lineWidth: 2)
                                      .scaleEffect(isAnimating ? 2 : 1)
                                      .opacity(isAnimating ? 0 : 1)
                              }
                      }
                  }
                  .drawingGroup()
              }
              .onAppear {
                  withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                      isAnimating = true
                  }
              }
          }
      }
      """#,
      explanation: AnimationExplanation(
          overview: "Creates a mesmerizing galaxy simulation with rotating spiral arms, background stars, and a glowing core.",
          keyConcepts: [
              AnimationConcept(
                  title: "Multiple Particle Systems",
                  description: "Combines different particle systems for stars, spiral arms, and core."
              ),
              AnimationConcept(
                  title: "Spiral Mathematics",
                  description: "Uses trigonometry with wobble effect for natural-looking spiral arms."
              ),
              AnimationConcept(
                  title: "Layered Effects",
                  description: "Combines gradients, blur, and opacity for realistic depth and glow."
              )
          ],
          tips: [
              "Use drawingGroup() for better performance with many particles",
              "Add wobble to spiral arms for organic movement",
              "Layer multiple effects for the core's glow",
              "Vary particle sizes and opacities for depth",
              "Consider adding interaction to control rotation"
          ]
      ),
      content: { isAnimating in
          ZStack {
              Color.black

              ZStack {
                  // Background stars
                  ForEach(0..<200, id: \.self) { index in
                      Circle()
                          .fill(.white.opacity(Double.random(in: 0.1...0.7)))
                          .frame(width: Double.random(in: 1...4))
                          .offset(
                              x: CGFloat.random(in: -300...300),
                              y: CGFloat.random(in: -300...300)
                          )
                          .blur(radius: 0.2)
                  }

                  // Spiral arms
                  ForEach(0..<4, id: \.self) { arm in
                      ForEach(0..<60, id: \.self) { index in
                          let angle = Double(index) * 0.15 + Double(arm) * .pi / 2
                          let radius = Double(index) * 3
                          let wobble = sin(Double(index) * 0.1) * 15

                          Circle()
                              .fill(
                                  LinearGradient(
                                      colors: [.blue, .purple],
                                      startPoint: .topLeading,
                                      endPoint: .bottomTrailing
                                  )
                              )
                              .frame(width: Double.random(in: 2...8))
                              .offset(
                                  x: cos(angle + (isAnimating ? .pi : 0)) * (radius + wobble),
                                  y: sin(angle + (isAnimating ? .pi : 0)) * (radius + wobble)
                              )
                              .opacity(Double.random(in: 0.3...0.9))
                              .blur(radius: 0.3)
                      }
                  }

                  // Enhanced central core
                  ZStack {
                      Circle()
                          .fill(
                              RadialGradient(
                                  colors: [.white, .blue.opacity(0.5), .clear],
                                  center: .center,
                                  startRadius: 5,
                                  endRadius: 50
                              )
                          )
                          .frame(width: 100, height: 100)
                          .blur(radius: 10)

                      Circle()
                          .fill(.white)
                          .frame(width: 20, height: 20)
                          .blur(radius: 3)
                          .overlay {
                              Circle()
                                  .stroke(.white.opacity(0.5), lineWidth: 2)
                                  .scaleEffect(isAnimating ? 2 : 1)
                                  .opacity(isAnimating ? 0 : 1)
                          }
                  }
              }
              .drawingGroup()
          }
      }
  )
}
