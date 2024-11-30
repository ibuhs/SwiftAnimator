import SwiftUI

@MainActor
class AnimationsViewModel: ObservableObject {
    @Published private(set) var animations: [AnimationExample] = []
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    init() {
        print("ViewModel initialized")
        loadInitialData()
    }
    
    private func loadInitialData() {
        print("Loading initial data")
        animations = AnimationExample.basicExamples +
                    AnimationExample.springExamples +
                    AnimationExample.transitionExamples +
                    AnimationExample.keyframeExamples +
                    AnimationExample.pathExamples +
      AnimationExample.gestureExamples +
                    AnimationExample.physicsExamples  +
      AnimationExample.particleExamples +
      AnimationExample.morphingExamples +
      AnimationExample.sequenceExamples  // Add this line

      print("Loaded \(animations.count) animations")
    }
    
    func loadAnimations() async {
        print("loadAnimations called")
        guard !isLoading else { return }
        
        isLoading = true
        print("Loading animations...")
        
        // Just load local data
        loadInitialData()
        
        isLoading = false
        print("Finished loading animations")
    }
} 
