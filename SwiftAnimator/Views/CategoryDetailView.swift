import SwiftUI

struct CategoryDetailView: View {
    let category: AnimationCategory
    @ObservedObject var viewModel: AnimationsViewModel
    
    var examples: [AnimationExample] {
        viewModel.animations.filter { $0.category == category }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Category header
                VStack(alignment: .leading, spacing: 8) {
                    Label(category.title, systemImage: category.icon)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(category.description)
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom)
                
                if examples.isEmpty {
                    ContentUnavailableView("No Animations", 
                                         systemImage: "square.stack.3d.up.slash",
                                         description: Text("No animations available for this category yet."))
                } else {
                    // Animation examples grid
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 300, maximum: 400), spacing: 20)
                    ], spacing: 20) {
                        ForEach(examples) { example in
                            EnhancedAnimationCard(example: example)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview
#Preview {
    CategoryDetailView(category: .basic, viewModel: AnimationsViewModel())
} 