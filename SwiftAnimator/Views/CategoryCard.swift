import SwiftUI

struct CategoryCard: View {
    let category: AnimationCategory
    @State private var isHovered = false
    @ObservedObject var viewModel: AnimationsViewModel
    
    var animationCount: Int {
        viewModel.animations.filter { $0.category == category }.count
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(category.gradient)
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: category.icon)
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                .shadow(radius: isHovered ? 4 : 2)
            
            Text(category.title)
                .font(.headline)
                .foregroundStyle(.primary)
            
            Text("\(animationCount) animations")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.background)
                .shadow(radius: isHovered ? 4 : 2)
        }
        .scaleEffect(isHovered ? 1.02 : 1)
        .animation(.spring(duration: 0.2), value: isHovered)
        .onHover { hovering in
            isHovered = hovering
        }
    }
}

#Preview {
    CategoryCard(category: .basic, viewModel: AnimationsViewModel())
        .frame(width: 200)
        .padding()
} 