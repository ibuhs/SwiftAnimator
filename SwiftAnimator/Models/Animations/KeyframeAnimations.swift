import SwiftUI

extension AnimationExample {
  static let keyframeExamples: [AnimationExample] = [
      AnimationExample(
          title: "Loading Sequence",
          description: "Multi-step loading animation",
          category: .keyframe,
          codePreview: #"""
        struct LoadingValues {
            var scale = 1.0
            var opacity = 1.0
            var rotation = Angle.zero
        }
        
        Circle()
            .keyframeAnimator(
                initialValue: LoadingValues(),
                trigger: isAnimating
            ) { content, value in
                content
                    .scaleEffect(value.scale)
                    .opacity(value.opacity)
                    .rotationEffect(value.rotation)
            } keyframes: { _ in
                KeyframeTrack(\.scale) {
                    LinearKeyframe(1.0, duration: 0.3)
                    LinearKeyframe(1.5, duration: 0.3)
                    LinearKeyframe(0.8, duration: 0.3)
                    LinearKeyframe(1.0, duration: 0.3)
                }
                KeyframeTrack(\.opacity) {
                    LinearKeyframe(1.0, duration: 0.3)
                    LinearKeyframe(0.5, duration: 0.3)
                    LinearKeyframe(0.8, duration: 0.3)
                    LinearKeyframe(1.0, duration: 0.3)
                }
                KeyframeTrack(\.rotation) {
                    LinearKeyframe(.degrees(0), duration: 0.3)
                    LinearKeyframe(.degrees(180), duration: 0.3)
                    LinearKeyframe(.degrees(270), duration: 0.3)
                    LinearKeyframe(.degrees(360), duration: 0.3)
                }
            }
        """#,
          usageExample: #"""
        struct LoadingSequenceView: View {
            @State private var isAnimating = false
            
            var body: some View {
                Circle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                    .keyframeAnimator(
                        initialValue: LoadingValues(),
                        trigger: isAnimating
                    ) { content, value in
                        content
                            .scaleEffect(value.scale)
                            .opacity(value.opacity)
                            .rotationEffect(value.rotation)
                    } keyframes: { _ in
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.0, duration: 0.3)
                            LinearKeyframe(1.5, duration: 0.3)
                            LinearKeyframe(0.8, duration: 0.3)
                            LinearKeyframe(1.0, duration: 0.3)
                        }
                        KeyframeTrack(\.opacity) {
                            LinearKeyframe(1.0, duration: 0.3)
                            LinearKeyframe(0.5, duration: 0.3)
                            LinearKeyframe(0.8, duration: 0.3)
                            LinearKeyframe(1.0, duration: 0.3)
                        }
                        KeyframeTrack(\.rotation) {
                            LinearKeyframe(.degrees(0), duration: 0.3)
                            LinearKeyframe(.degrees(180), duration: 0.3)
                            LinearKeyframe(.degrees(270), duration: 0.3)
                            LinearKeyframe(.degrees(360), duration: 0.3)
                        }
                    }
            }
        }
        """#,
          explanation: AnimationExplanation(
              overview: "Creates a complex loading animation using keyframe animations to precisely control multiple properties.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Keyframe Tracks",
                      description: "Separate animation sequences for different properties that run simultaneously."
                  ),
                  AnimationConcept(
                      title: "Linear Keyframes",
                      description: "Precise control over timing and values at each step of the animation."
                  )
              ],
              tips: [
                  "Use multiple tracks for complex animations",
                  "Coordinate durations between tracks",
                  "Consider using different easing for each keyframe",
                  "Great for precise multi-step animations"
              ]
          ),
          content: { isAnimating in
              let values = LoadingValues()
              Circle()
                  .fill(.blue)
                  .frame(width: 50, height: 50)
                  .keyframeAnimator(
                      initialValue: values,
                      trigger: isAnimating
                  ) { content, value in
                      content
                          .scaleEffect(value.scale)
                          .opacity(value.opacity)
                          .rotationEffect(value.rotation)
                  } keyframes: { _ in
                      KeyframeTrack(\.scale) {
                          LinearKeyframe(1.0, duration: 0.3)
                          LinearKeyframe(1.5, duration: 0.3)
                          LinearKeyframe(0.8, duration: 0.3)
                          LinearKeyframe(1.0, duration: 0.3)
                      }
                      KeyframeTrack(\.opacity) {
                          LinearKeyframe(1.0, duration: 0.3)
                          LinearKeyframe(0.5, duration: 0.3)
                          LinearKeyframe(0.8, duration: 0.3)
                          LinearKeyframe(1.0, duration: 0.3)
                      }
                      KeyframeTrack(\.rotation) {
                          LinearKeyframe(.degrees(0), duration: 0.3)
                          LinearKeyframe(.degrees(180), duration: 0.3)
                          LinearKeyframe(.degrees(270), duration: 0.3)
                          LinearKeyframe(.degrees(360), duration: 0.3)
                      }
                  }
          }
      ),// Add this to the keyframeExamples array
      AnimationExample(
          title: "Loading Dots",
          description: "Keyframe animation with multiple dots",
          category: .keyframe,
          codePreview: #"""
          struct LoadingValues {
              var scale = 1.0
              var offset: CGFloat = 0
          }
          
          HStack(spacing: 8) {
              ForEach(0..<3) { index in
                  Circle()
                      .keyframeAnimator(
                          initialValue: LoadingValues(),
                          trigger: isAnimating
                      ) { content, value in
                          content
                              .scaleEffect(value.scale)
                              .offset(y: value.offset)
                      } keyframes: { _ in
                          KeyframeTrack(\.scale) {
                              LinearKeyframe(1.0, duration: 0.2)
                              LinearKeyframe(1.5, duration: 0.2)
                              LinearKeyframe(1.0, duration: 0.2)
                              LinearKeyframe(1.0, duration: 0.6)
                          }
                          KeyframeTrack(\.offset) {
                              LinearKeyframe(0, duration: 0.2)
                              LinearKeyframe(-20, duration: 0.2)
                              LinearKeyframe(0, duration: 0.2)
                              LinearKeyframe(0, duration: 0.6)
                          }
                      }
              }
          }
          """#,
          usageExample: #"""
          struct LoadingDotsView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  HStack(spacing: 8) {
                      ForEach(0..<3) { index in
                          Circle()
                              .fill(.blue)
                              .frame(width: 20, height: 20)
                              .keyframeAnimator(
                                  initialValue: LoadingValues(),
                                  trigger: isAnimating
                              ) { content, value in
                                  content
                                      .scaleEffect(value.scale)
                                      .offset(y: value.offset)
                              } keyframes: { _ in
                                  KeyframeTrack(\.scale) {
                                      LinearKeyframe(1.0, duration: 0.2)
                                      LinearKeyframe(1.5, duration: 0.2)
                                      LinearKeyframe(1.0, duration: 0.2)
                                      LinearKeyframe(1.0, duration: 0.6)
                                  }
                                  KeyframeTrack(\.offset) {
                                      LinearKeyframe(0, duration: 0.2)
                                      LinearKeyframe(-20, duration: 0.2)
                                      LinearKeyframe(0, duration: 0.2)
                                      LinearKeyframe(0, duration: 0.6)
                                  }
                              }
                      }
                  }
                  .onAppear {
                      isAnimating = true
                  }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a loading animation with multiple dots using keyframe animations for precise control over timing and movement.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Multiple Properties",
                      description: "Animates both scale and position using keyframe tracks."
                  ),
                  AnimationConcept(
                      title: "Timing Control",
                      description: "Uses different durations for each phase of the animation."
                  ),
                  AnimationConcept(
                      title: "Multiple Elements",
                      description: "Applies the same keyframe animation to multiple views."
                  )
              ],
              tips: [
                  "Adjust timing for different rhythms",
                  "Experiment with different scales and offsets",
                  "Consider adding delay between dots",
                  "Use for loading indicators or progress feedback"
              ]
          ),
          content: { isAnimating in
              HStack(spacing: 8) {
                  ForEach(0..<3, id: \.self) { index in
                      Circle()
                          .fill(.blue)
                          .frame(width: 20, height: 20)
                          .scaleEffect(isAnimating ? 1.5 : 1.0)
                          .offset(y: isAnimating ? -20 : 0)
                  }
              }
          }
      ),
      AnimationExample(
          title: "Heartbeat",
          description: "Realistic heartbeat animation with keyframes",
          category: .keyframe,
          codePreview: #"""
          struct HeartbeatValues {
              var scale = 1.0
              var opacity = 1.0
          }
          
          Circle()
              .keyframeAnimator(initialValue: HeartbeatValues()) { content, value in
                  content
                      .scaleEffect(value.scale)
                      .opacity(value.opacity)
              } keyframes: { _ in
                  KeyframeTrack(\.scale) {
                      LinearKeyframe(1.0, duration: 0.1)
                      LinearKeyframe(1.3, duration: 0.1)
                      LinearKeyframe(1.0, duration: 0.1)
                      LinearKeyframe(1.2, duration: 0.1)
                      LinearKeyframe(1.0, duration: 0.6)
                  }
                  KeyframeTrack(\.opacity) {
                      LinearKeyframe(1.0, duration: 0.1)
                      LinearKeyframe(0.8, duration: 0.1)
                      LinearKeyframe(1.0, duration: 0.1)
                      LinearKeyframe(0.9, duration: 0.1)
                      LinearKeyframe(1.0, duration: 0.6)
                  }
              }
          """#,
          usageExample: #"""
          struct HeartbeatView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Circle()
                      .fill(.red)
                      .frame(width: 50, height: 50)
                      .keyframeAnimator(
                          initialValue: HeartbeatValues(),
                          trigger: isAnimating
                      ) { content, value in
                          content
                              .scaleEffect(value.scale)
                              .opacity(value.opacity)
                      } keyframes: { _ in
                          KeyframeTrack(\.scale) {
                              LinearKeyframe(1.0, duration: 0.1)
                              LinearKeyframe(1.3, duration: 0.1)
                              LinearKeyframe(1.0, duration: 0.1)
                              LinearKeyframe(1.2, duration: 0.1)
                              LinearKeyframe(1.0, duration: 0.6)
                          }
                          KeyframeTrack(\.opacity) {
                              LinearKeyframe(1.0, duration: 0.1)
                              LinearKeyframe(0.8, duration: 0.1)
                              LinearKeyframe(1.0, duration: 0.1)
                              LinearKeyframe(0.9, duration: 0.1)
                              LinearKeyframe(1.0, duration: 0.6)
                          }
                      }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a realistic heartbeat effect using precisely timed keyframes for both scale and opacity.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Multiple Keyframes",
                      description: "Uses multiple keyframes to create a complex, multi-step animation."
                  ),
                  AnimationConcept(
                      title: "Timing Control",
                      description: "Precise control over duration of each animation step."
                  )
              ],
              tips: [
                  "Adjust timings to match real heartbeat patterns",
                  "Use with haptic feedback for more realism",
                  "Consider easing functions for smoother transitions",
                  "Can be used for health-related UI elements"
              ]
          ),
          content: { isAnimating in
              Circle()
                  .fill(.red)
                  .frame(width: 50, height: 50)
                  .scaleEffect(isAnimating ? 1.3 : 1.0)
                  .opacity(isAnimating ? 0.8 : 1.0)
          }
      ),

      AnimationExample(
          title: "Typing Cursor",
          description: "Text cursor blinking animation with keyframes",
          category: .keyframe,
          codePreview: #"""
          struct CursorValues {
              var opacity = 1.0
          }
          
          Rectangle()
              .keyframeAnimator(initialValue: CursorValues()) { content, value in
                  content
                      .opacity(value.opacity)
              } keyframes: { _ in
                  KeyframeTrack(\.opacity) {
                      LinearKeyframe(1.0, duration: 0.5)
                      LinearKeyframe(0.0, duration: 0.5)
                  }
              }
          """#,
          usageExample: #"""
          struct TypingCursorView: View {
              @State private var isAnimating = false
              
              var body: some View {
                  Rectangle()
                      .fill(.primary)
                      .frame(width: 2, height: 20)
                      .keyframeAnimator(
                          initialValue: CursorValues(),
                          trigger: isAnimating,
                          repeating: true
                      ) { content, value in
                          content
                              .opacity(value.opacity)
                      } keyframes: { _ in
                          KeyframeTrack(\.opacity) {
                              LinearKeyframe(1.0, duration: 0.5)
                              LinearKeyframe(0.0, duration: 0.5)
                          }
                      }
                      .onAppear { isAnimating = true }
              }
          }
          """#,
          explanation: AnimationExplanation(
              overview: "Creates a text cursor blinking effect using keyframe animation with precise timing.",
              keyConcepts: [
                  AnimationConcept(
                      title: "Repeating Animation",
                      description: "Uses repeating keyframes for continuous blinking effect."
                  ),
                  AnimationConcept(
                      title: "Simple Keyframes",
                      description: "Demonstrates how simple keyframes can create effective UI elements."
                  )
              ],
              tips: [
                  "Adjust blink timing for different effects",
                  "Consider system appearance settings",
                  "Use with text input fields",
                  "Can be modified for different cursor styles"
              ]
          ),
          content: { isAnimating in
              Rectangle()
                  .fill(.primary)
                  .frame(width: 2, height: 20)
                  .opacity(isAnimating ? 0 : 1)
          }
      )
  ]

} 
