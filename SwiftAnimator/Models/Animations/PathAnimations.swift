import SwiftUI

extension AnimationExample {
  static let pathExamples: [AnimationExample] = [
      AnimationExample(
          title: "Circle Path",
          description: "Animation along a circular path",
          category: .path,
          codePreview: """
          Circle()
              .modifier(CirclePathModifier(angle: isAnimating ? 360 : 0))
              .animation(.linear(duration: 2), value: isAnimating)
          """,
          usageExample: """
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
          
          struct CirclePathView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.red)
                      .frame(width: 20, height: 20)
                      .modifier(CirclePathModifier(angle: isAnimating ? 360 : 0))
                      .animation(.linear(duration: 2).repeatForever(autoreverses: false),
                               value: isAnimating)
                      .onAppear { isAnimating = true }
              }
          }
          """,
          explanation: AnimationExplanation(
              overview: "Demonstrates how to animate views along a circular path using trigonometry.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Custom Modifier",
                      description: "Uses a ViewModifier to calculate position along the path."
                  ),
                  AnimationConcept(
                      title: "Trigonometry",
                      description: "Uses sine and cosine to calculate circular motion."
                  )
              ],
              tips: [
                  "Adjust radius for different circle sizes",
                  "Use different timing curves for variety",
                  "Consider adding rotation to the moving object"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.red)
                  .frame(width: 20, height: 20)
                  .modifier(CirclePathModifier(angle: isAnimating ? 360 : 0))
          }
      ),// Add these to the pathExamples array
      AnimationExample(
          title: "Figure Eight",
          description: "Animation along a figure-eight path",
          category: .path,
          codePreview: #"""
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
          
          Circle()
              .modifier(FigureEightModifier(
                  progress: isAnimating ? 1 : 0,
                  width: 100,
                  height: 50
              ))
              .animation(.linear(duration: 3).repeatForever(autoreverses: false),
                        value: isAnimating)
          """#,
          usageExample: #"""
          struct FigureEightView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.blue)
                      .frame(width: 20, height: 20)
                      .modifier(FigureEightModifier(
                          progress: isAnimating ? 1 : 0,
                          width: 100,
                          height: 50
                      ))
                      .animation(
                          .linear(duration: 3)
                          .repeatForever(autoreverses: false),
                          value: isAnimating
                      )
                      .onAppear { isAnimating = true }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a smooth figure-eight motion using parametric equations.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Parametric Equations",
                      description: "Uses sine functions with different frequencies to create the figure-eight shape."
                  ),
                  AnimationConcept(
                      title: "Continuous Motion",
                      description: "Creates a seamless, repeating animation path."
                  )
              ],
              tips: [
                  "Adjust width and height for different sized paths",
                  "Modify the frequency multipliers for different shapes",
                  "Consider adding rotation to the moving object",
                  "Great for loading animations or ambient motion"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.blue)
                  .frame(width: 20, height: 20)
                  .modifier(FigureEightModifier(
                      progress: isAnimating ? 1 : 0,
                      width: 50,
                      height: 25
                  ))
          }
      ),

      AnimationExample(
          title: "Spiral Path",
          description: "Animation along a spiral path",
          category: .path,
          codePreview: #"""
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
          
          Circle()
              .modifier(SpiralModifier(
                  progress: isAnimating ? 1 : 0,
                  maxRadius: 100
              ))
              .animation(.easeInOut(duration: 2), value: isAnimating)
          """#,
          usageExample: #"""
          struct SpiralView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.purple)
                      .frame(width: 20, height: 20)
                      .modifier(SpiralModifier(
                          progress: isAnimating ? 1 : 0,
                          maxRadius: 100
                      ))
                      .animation(
                          .easeInOut(duration: 2)
                          .repeatForever(autoreverses: true),
                          value: isAnimating
                      )
                      .onAppear { isAnimating = true }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a spiral motion by combining rotating angle with increasing radius.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Polar Coordinates",
                      description: "Uses angle and radius to define the spiral path."
                  ),
                  AnimationConcept(
                      title: "Progressive Motion",
                      description: "Combines rotation with increasing distance from center."
                  )
              ],
              tips: [
                  "Adjust maxRadius for different spiral sizes",
                  "Modify the angle multiplier for tighter or looser spirals",
                  "Consider adding fade effects at the extremes",
                  "Great for loading or processing animations"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.purple)
                  .frame(width: 20, height: 20)
                  .modifier(SpiralModifier(
                      progress: isAnimating ? 1 : 0,
                      maxRadius: 50
                  ))
          }
      ),

      AnimationExample(
          title: "Wave Path",
          description: "Animation along a sine wave",
          category: .path,
          codePreview: #"""
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
          
          Circle()
              .modifier(WaveModifier(
                  progress: isAnimating ? 1 : -1,
                  amplitude: 50,
                  frequency: 4
              ))
              .animation(.linear(duration: 2).repeatForever(autoreverses: false),
                        value: isAnimating)
          """#,
          usageExample: #"""
          struct WavePathView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.green)
                      .frame(width: 20, height: 20)
                      .modifier(WaveModifier(
                          progress: isAnimating ? 1 : -1,
                          amplitude: 50,
                          frequency: 4
                      ))
                      .animation(
                          .linear(duration: 2)
                          .repeatForever(autoreverses: false),
                          value: isAnimating
                      )
                      .onAppear { isAnimating = true }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a wave motion by combining horizontal movement with sine-based vertical oscillation.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Sine Wave",
                      description: "Uses sine function to create smooth up and down motion."
                  ),
                  AnimationConcept(
                      title: "Wave Parameters",
                      description: "Controls wave shape through amplitude and frequency."
                  )
              ],
              tips: [
                  "Adjust amplitude for different wave heights",
                  "Modify frequency for different wave lengths",
                  "Consider combining multiple waves",
                  "Great for fluid or oscillating animations"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.green)
                  .frame(width: 20, height: 20)
                  .modifier(WaveModifier(
                      progress: isAnimating ? 1 : -1,
                      amplitude: 25,
                      frequency: 4
                  ))
          }
      )
  ]
}
